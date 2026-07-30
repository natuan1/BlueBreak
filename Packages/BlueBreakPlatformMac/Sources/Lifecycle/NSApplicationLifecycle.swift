import AppKit
import BlueBreakApplication

/// `AppLifecyclePort` on top of `NSApplication`.
@MainActor
public final class NSApplicationLifecycle: AppLifecyclePort {
    private let application: NSApplication

    public init(application: NSApplication = .shared) {
        self.application = application
    }

    public func hideDockIcon() {
        application.setActivationPolicy(.accessory)
    }

    public func quit() {
        application.terminate(nil)
    }
}
