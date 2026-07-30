import AppKit

/// Process entry point.
///
/// Hand-rolled rather than SwiftUI's `App` protocol: BlueBreak has no window at
/// launch, only a status item, and later slices need direct control over
/// `NSWindow` for the forced-break overlay.
@main
@MainActor
enum BlueBreakApp {
    static func main() {
        let application = NSApplication.shared
        let delegate = AppDelegate()
        // NSApplication holds its delegate weakly.
        application.delegate = delegate
        withExtendedLifetime(delegate) {
            application.run()
        }
    }
}
