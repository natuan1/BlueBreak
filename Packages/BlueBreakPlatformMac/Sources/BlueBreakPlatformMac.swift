//  BlueBreakPlatformMac
//
//  Every macOS API the app touches: activity tracking, the forced-break overlay
//  windows, display topology, workspace and sleep notifications, login item,
//  audio and logging — plus the menu bar status item that hosts the app's UI.
//
//  Implements the ports declared in BlueBreakApplication, its only BlueBreak
//  dependency. Must not import BlueBreakFeatures: SwiftUI content reaches this
//  layer as an opaque view controller handed over by the app
//  (architecture.md §8).
