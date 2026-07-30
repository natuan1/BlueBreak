import Foundation

/// One layer's slice of the dependency rules in `architecture.md` §8.
struct ModuleBoundary: Sendable, CustomStringConvertible {
    /// The layer, as §8 names it.
    let name: String

    /// Repository-relative directory holding that layer's production sources.
    /// Test sources are excluded — a test may legitimately import things the
    /// module under test may not.
    let path: String

    let rule: Rule

    enum Rule: Sendable {
        /// The module may import nothing beyond these. Used for
        /// `BlueBreakDomain`, which §8 restricts to "Swift Standard
        /// Library/Foundation tối thiểu".
        case allowOnly(Set<String>)

        /// The module may import anything except these.
        case forbid(Set<String>)

        func forbids(_ module: String) -> Bool {
            switch self {
            case .allowOnly(let allowed): !allowed.contains(module)
            case .forbid(let forbidden): forbidden.contains(module)
            }
        }
    }

    var description: String { name }
}

extension ModuleBoundary {
    /// Every BlueBreak module, in the order §8 lists them.
    ///
    /// The `forbid` sets come from §8's "Không cho phép" table. Where §8 names a
    /// symbol rather than a module — `Feature → NSWindow`,
    /// `Feature → CGEventSource` — the ban is expressed as the framework that
    /// symbol lives in, which is stricter and cannot be worked around.
    static let all: [ModuleBoundary] = [
        ModuleBoundary(
            name: "BlueBreakDomain",
            path: "Packages/BlueBreakDomain/Sources",
            rule: .allowOnly(["Foundation"])
        ),
        ModuleBoundary(
            name: "BlueBreakApplication",
            path: "Packages/BlueBreakApplication/Sources",
            // §8 names only SwiftData. AppKit and SwiftUI are added because the
            // Application layer sits *below* Platform in the graph and its ports
            // are what keep the domain platform-neutral (§4, §6.3) — a UI import
            // here would defeat the arrangement even though §8 does not spell it
            // out.
            rule: .forbid(["SwiftData", "AppKit", "SwiftUI"])
        ),
        ModuleBoundary(
            name: "BlueBreakPlatformMac",
            path: "Packages/BlueBreakPlatformMac/Sources",
            rule: .forbid(["BlueBreakFeatures"])
        ),
        ModuleBoundary(
            name: "BlueBreakPersistence",
            path: "Packages/BlueBreakPersistence/Sources",
            rule: .forbid(["SwiftUI", "AppKit"])
        ),
        ModuleBoundary(
            name: "BlueBreakDesignSystem",
            path: "Packages/BlueBreakDesignSystem/Sources",
            // "Không phụ thuộc business module" — the design system must stay
            // reusable and previewable on its own.
            rule: .forbid([
                "BlueBreakDomain",
                "BlueBreakApplication",
                "BlueBreakPlatformMac",
                "BlueBreakPersistence",
                "BlueBreakFeatures",
            ])
        ),
        ModuleBoundary(
            name: "BlueBreakFeatures",
            path: "Packages/BlueBreakFeatures/Sources",
            // NSWindow lives in AppKit, CGEventSource in CoreGraphics.
            rule: .forbid(["SwiftData", "AppKit", "CoreGraphics"])
        ),
        ModuleBoundary(
            name: "BlueBreakMac",
            path: "App/BlueBreakMac",
            // §8 gives the app shell four dependencies; Domain and DesignSystem
            // are reached through Application and Features respectively.
            rule: .forbid(["BlueBreakDomain", "BlueBreakDesignSystem", "SwiftData"])
        ),
    ]
}
