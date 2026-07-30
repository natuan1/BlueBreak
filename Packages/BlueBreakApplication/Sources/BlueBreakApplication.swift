//  BlueBreakApplication
//
//  Orchestration layer: the session engine, use cases, and the ports through
//  which the domain reaches the outside world. Depends on BlueBreakDomain only.
//
//  Ports are declared here and implemented in BlueBreakPlatformMac or
//  BlueBreakPersistence, so they must stay framework-neutral — no AppKit types,
//  no SwiftData (architecture.md §8).
