/// Process-level lifecycle the app shell needs from the host platform.
///
/// Deliberately free of AppKit types so this layer stays platform-neutral
/// (architecture.md §8); `BlueBreakPlatformMac` adapts it onto `NSApplication`.
@MainActor
public protocol AppLifecyclePort: AnyObject {
    /// BlueBreak lives in the menu bar and claims no Dock icon.
    func hideDockIcon()

    func quit()
}
