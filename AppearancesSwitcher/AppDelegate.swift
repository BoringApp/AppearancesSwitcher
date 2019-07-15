//
//  AppDelegate.swift
//  Apperance
//
//  Created by gm on 2019/7/15.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow?
    var viewController: ViewController?
    
    // MARK: NSApplicationDelegate
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        let width:CGFloat = 350
        let height:CGFloat = 300
        let x = (NSScreen.main!.frame.width - width) / 2
        let y = ( NSScreen.main!.frame.height - height) / 2
        let rect = NSRect(x: x, y: y, width: width, height: height)
        window = NSWindow(contentRect: rect,
                          styleMask: [.closable, .miniaturizable, .resizable, .titled],
                          backing: .buffered,
                          defer: false)
        viewController = ViewController()
        let content = window!.contentView!
        let view = viewController!.view
        content.addSubview(view)
        window!.makeKeyAndOrderFront(nil)
    }
}

