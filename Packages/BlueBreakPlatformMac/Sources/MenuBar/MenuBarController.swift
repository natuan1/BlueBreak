import BlueBreakApplication

/// Owns the app's menu bar presence: what the status item does when clicked and
/// how the app leaves the screen.
///
/// The AppKit specifics — `NSStatusItem`, `NSPopover` — sit behind
/// `MenuBarPopoverPresenting` and `AppLifecyclePort`, so the shell's decisions
/// are testable without a running application.
@MainActor
public final class MenuBarController {
    private let lifecycle: AppLifecyclePort
    private let popover: MenuBarPopoverPresenting

    public init(lifecycle: AppLifecyclePort, popover: MenuBarPopoverPresenting) {
        self.lifecycle = lifecycle
        self.popover = popover
    }

    /// Installs the menu bar presence. BlueBreak is a menu bar app, so it gives
    /// up its Dock icon here as well as via `LSUIElement` in Info.plist — the
    /// plist avoids a Dock flash at launch, this call is the runtime authority.
    public func start() {
        lifecycle.hideDockIcon()
        popover.onClick = { [weak self] in self?.togglePopover() }
    }

    /// Wired to the Quit control in the popover content, which lives in
    /// `BlueBreakFeatures` and so cannot reach `NSApplication` itself.
    public func quit() {
        lifecycle.quit()
    }

    private func togglePopover() {
        if popover.isShown {
            popover.hide()
        } else {
            popover.show()
        }
    }
}
