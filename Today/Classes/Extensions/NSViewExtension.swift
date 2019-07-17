//
//  NSViewExtension.swift
//  Today
//
//  Created by gm on 2019/7/16.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa

extension NSView {
  
    /// Set NSView background color.
    /// Private method may occur exception.
    /// - Parameter color: NSColor
    func setBackground(color: NSColor) {
        self.setValue(color, forKey: "backgroundColor")
    }
}
