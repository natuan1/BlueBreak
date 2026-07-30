import SwiftUI

/// Placeholder contents of the menu bar popover. The dashboard, Pomodoro
/// controls and active-cycle readout replace this body in later slices; for now
/// it exists so the shell has something to show and a working way out.
///
/// Quit is raised as a closure — `BlueBreakFeatures` cannot reach
/// `NSApplication` (architecture.md §8).
public struct MenuBarPopoverView: View {
    private let onQuit: () -> Void

    public init(onQuit: @escaping () -> Void) {
        self.onQuit = onQuit
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("BlueBreak")
                .font(.headline)

            Text("No timers yet. Forced breaks, Pomodoro and statistics arrive in later slices.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)

            Divider()

            Button("Quit BlueBreak", action: onQuit)
                .keyboardShortcut("q")
        }
        .padding(16)
        .frame(width: 260, alignment: .leading)
    }
}
