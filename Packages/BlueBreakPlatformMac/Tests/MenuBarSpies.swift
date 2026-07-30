import BlueBreakApplication

@testable import BlueBreakPlatformMac

@MainActor
final class AppLifecycleSpy: AppLifecyclePort {
    private(set) var didHideDockIcon = false
    private(set) var didQuit = false

    func hideDockIcon() {
        didHideDockIcon = true
    }

    func quit() {
        didQuit = true
    }
}

@MainActor
final class MenuBarPopoverSpy: MenuBarPopoverPresenting {
    private(set) var isShown = false
    var onClick: (() -> Void)?

    func show() {
        isShown = true
    }

    func hide() {
        isShown = false
    }

    /// Stands in for the user clicking the status item.
    func simulateClick() {
        onClick?()
    }
}
