import Foundation

/// Reads the `import` declarations out of a module's sources and reports the ones
/// its `ModuleBoundary` forbids.
struct ImportScanner {
    /// A forbidden import, located well enough to fix.
    struct Violation: CustomStringConvertible {
        let file: String
        let line: Int
        let module: String

        var description: String { "\(file):\(line) imports \(module)" }
    }

    private let repositoryRoot: URL

    init(repositoryRoot: URL = .repositoryRoot) {
        self.repositoryRoot = repositoryRoot
    }

    func swiftFiles(of boundary: ModuleBoundary) throws -> [URL] {
        let root = repositoryRoot.appending(path: boundary.path)
        guard
            let walker = FileManager.default.enumerator(
                at: root,
                includingPropertiesForKeys: nil
            )
        else {
            return []
        }

        return walker
            .compactMap { $0 as? URL }
            .filter { $0.pathExtension == "swift" }
            .sorted { $0.path < $1.path }
    }

    func violations(of boundary: ModuleBoundary) throws -> [Violation] {
        try swiftFiles(of: boundary).flatMap { file in
            let relativePath = file.path.replacingOccurrences(
                of: repositoryRoot.path + "/",
                with: ""
            )
            return try importedModules(in: file)
                .filter { boundary.rule.forbids($0.module) }
                .map { Violation(file: relativePath, line: $0.line, module: $0.module) }
        }
    }

    private func importedModules(in file: URL) throws -> [(module: String, line: Int)] {
        try String(contentsOf: file, encoding: .utf8)
            .split(separator: "\n", omittingEmptySubsequences: false)
            .enumerated()
            .compactMap { index, line in
                guard let module = Self.importedModule(in: line) else { return nil }
                return (module, index + 1)
            }
    }

    /// The module a single line imports, or `nil` if it is not an import.
    ///
    /// Handles `@testable`/`@preconcurrency` attributes and the
    /// `import struct Foundation.Data` form, whose module is the first dotted
    /// component. Deliberately naive about imports inside comments and `#if`
    /// blocks: a boundary test that occasionally over-reports is safer than one
    /// that needs a Swift parser to stay correct.
    static func importedModule(in line: Substring) -> String? {
        var words = line.split(whereSeparator: \.isWhitespace).map(String.init)

        while let first = words.first, first.hasPrefix("@") {
            words.removeFirst()
        }

        guard words.first == "import", words.count >= 2 else { return nil }

        let declarationKinds: Set<String> = [
            "struct", "class", "enum", "protocol", "typealias", "func", "var", "let", "actor",
        ]
        var remainder = words[1]
        if declarationKinds.contains(remainder), words.count >= 3 {
            remainder = words[2]
        }

        return remainder.split(separator: ".").first.map(String.init)
    }
}

extension URL {
    /// The repository root, derived from this file's own location rather than the
    /// test runner's working directory, which xcodebuild does not guarantee.
    static var repositoryRoot: URL {
        URL(filePath: #filePath)  // Tests/ArchitectureTests/ImportScanner.swift
            .deletingLastPathComponent()  // Tests/ArchitectureTests
            .deletingLastPathComponent()  // Tests
            .deletingLastPathComponent()  // <repo root>
    }
}
