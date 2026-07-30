import AppKit

/// The real menu bar popover: an `NSStatusItem` in the system status bar with an
/// `NSPopover` hanging off it.
///
/// The content arrives as an opaque `NSViewController` so this layer never sees
/// `BlueBreakFeatures` (architecture.md §8 forbids Platform → Feature).
@MainActor
public final class StatusItemPopover: NSObject, MenuBarPopoverPresenting {
    private let statusItem: NSStatusItem
    private let popover: NSPopover

    public var onClick: (() -> Void)?

    public var isShown: Bool { popover.isShown }

    public init(contentViewController: NSViewController) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

        popover = NSPopover()
        popover.contentViewController = contentViewController
        // `.applicationDefined` rather than `.transient`: a transient popover
        // installs its own event monitor and can close itself on the very
        // mouse-down that also triggers our button action, which turns a
        // close-on-second-click into a close-then-reopen flicker. We dismiss it
        // ourselves instead — on the second click, or when the user moves to
        // another app.
        popover.behavior = .applicationDefined

        super.init()

        if let button = statusItem.button {
            // Placeholder glyph; the real menu bar icon arrives with the design
            // system slice.
            button.image = NSImage(
                systemSymbolName: "cup.and.saucer",
                accessibilityDescription: "BlueBreak"
            )
            button.target = self
            button.action = #selector(statusItemClicked)
        }

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applicationDidResignActive),
            name: NSApplication.didResignActiveNotification,
            object: nil
        )
    }

    public func show() {
        guard let button = statusItem.button else { return }
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        // Clicking a status item does not activate an accessory app. Without this
        // the popover would open unfocused — its keyboard shortcuts dead, and
        // `didResignActiveNotification` never firing because the app was never
        // active, leaving the popover stranded over whatever the user switched to.
        NSApplication.shared.activate()
    }

    public func hide() {
        popover.performClose(nil)
    }

    @objc private func statusItemClicked() {
        onClick?()
    }

    @objc private func applicationDidResignActive() {
        hide()
    }
}
