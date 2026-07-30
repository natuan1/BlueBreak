import AppKit
import BlueBreakFeatures
import BlueBreakPlatformMac
import SwiftUI

/// Composition root. The only place that knows about every layer at once, and so
/// the only place allowed to wire a SwiftUI view from `BlueBreakFeatures` into an
/// AppKit host from `BlueBreakPlatformMac`.
@MainActor
final class AppCoordinator {
    private let lifecycle = NSApplicationLifecycle()
    private var menuBar: MenuBarController?

    func start() {
        let content = NSHostingController(
            rootView: MenuBarPopoverView(onQuit: { [weak self] in self?.menuBar?.quit() })
        )
        let menuBar = MenuBarController(
            lifecycle: lifecycle,
            popover: StatusItemPopover(contentViewController: content)
        )
        self.menuBar = menuBar
        menuBar.start()
    }
}
