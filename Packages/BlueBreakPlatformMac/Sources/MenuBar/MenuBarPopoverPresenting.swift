/// The menu bar popover as `MenuBarController` needs it: something that reports
/// whether it is on screen, can be shown and hidden, and tells us when the user
/// clicks the status item it hangs off.
///
/// Keeping `NSStatusItem` and `NSPopover` behind this protocol is what lets the
/// shell's behaviour be tested without a running `NSApplication`.
@MainActor
public protocol MenuBarPopoverPresenting: AnyObject {
    var isShown: Bool { get }

    /// Invoked when the user clicks the status item.
    var onClick: (() -> Void)? { get set }

    func show()
    func hide()
}
