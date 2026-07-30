import Testing

/// `architecture.md` §8 restricts what each layer may reach for. The inter-package
/// half of those rules is enforced by the SPM dependency graph, but the
/// prohibitions on system frameworks are not: AppKit, SwiftUI and SwiftData ship
/// in the macOS SDK and are importable from any target regardless of what its
/// package declares. These tests are what actually holds that line.
@Test(arguments: ModuleBoundary.all)
func moduleImportsOnlyWhatItIsAllowedTo(boundary: ModuleBoundary) throws {
    let violations = try ImportScanner().violations(of: boundary)

    #expect(
        violations.isEmpty,
        """
        \(boundary.name) breaks the dependency rules in architecture.md §8:
        \(violations.map(\.description).joined(separator: "\n"))
        """
    )
}

/// Guards the guard: if the scanner silently stopped finding files, every rule
/// above would pass vacuously.
@Test(arguments: ModuleBoundary.all)
func moduleHasSourceFilesToCheck(boundary: ModuleBoundary) throws {
    let files = try ImportScanner().swiftFiles(of: boundary)

    #expect(files.isEmpty == false, "No Swift files found under \(boundary.path)")
}
