import Testing

@testable import BlueBreakPlatformMac

@MainActor
@Test func startingTheMenuBarHidesTheDockIcon() {
    let lifecycle = AppLifecycleSpy()
    let controller = MenuBarController(lifecycle: lifecycle, popover: MenuBarPopoverSpy())

    controller.start()

    #expect(lifecycle.didHideDockIcon)
}

@MainActor
@Test func clickingTheStatusItemShowsThePopover() {
    let popover = MenuBarPopoverSpy()
    let controller = MenuBarController(lifecycle: AppLifecycleSpy(), popover: popover)
    controller.start()

    popover.simulateClick()

    #expect(popover.isShown)
}

@MainActor
@Test func clickingTheStatusItemAgainHidesThePopover() {
    let popover = MenuBarPopoverSpy()
    let controller = MenuBarController(lifecycle: AppLifecycleSpy(), popover: popover)
    controller.start()
    popover.simulateClick()

    popover.simulateClick()

    #expect(popover.isShown == false)
}

@MainActor
@Test func quittingFromThePopoverTerminatesTheApp() {
    let lifecycle = AppLifecycleSpy()
    let controller = MenuBarController(lifecycle: lifecycle, popover: MenuBarPopoverSpy())
    controller.start()

    controller.quit()

    #expect(lifecycle.didQuit)
}
