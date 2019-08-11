//
//  AppDelegate.swift
//  Apperance
//
//  Created by gm on 2019/7/15.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    let window: NSWindow = {
        let width:CGFloat = 350
        let height:CGFloat = 200
        let x = (NSScreen.main!.frame.width - width) / 2
        let y = ( NSScreen.main!.frame.height - height) / 2
        let rect = NSRect(x: x, y: y, width: width, height: height)
        let w = NSWindow(contentRect: rect,
                         styleMask: [.closable, .titled],
                         backing: .buffered,
                         defer: false)
        return w
    }()

    // MARK: NSApplicationDelegate
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        self.window.title = "AppearancesSwitcher"
        self.window.makeKeyAndOrderFront(self)
        let viewController = ViewController()
        let content = self.window.contentView!
        content.addSubview(viewController.view)
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
