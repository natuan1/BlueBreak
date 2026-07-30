//  BlueBreakFeatures
//
//  SwiftUI screens: onboarding, dashboard, menu bar popover, Pomodoro controls,
//  pre-break warning, forced-break overlay content, statistics and settings.
//  Depends on BlueBreakApplication for behaviour and BlueBreakDesignSystem for
//  looks.
//
//  Windowing and event-tap primitives are forbidden here — no NSWindow, no
//  CGEventSource, no SwiftData (architecture.md §8). Views raise intent through
//  closures and view models; BlueBreakPlatformMac owns the AppKit side.
