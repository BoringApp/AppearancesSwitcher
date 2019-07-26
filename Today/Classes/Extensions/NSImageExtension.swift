//
//  NSImageExtension.swift
//  Today
//
//  Created by gm on 2019/7/16.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa

extension NSImage {
    class func tint(color: NSColor) -> NSImage {
        let image = self.copy() as! NSImage
        image.lockFocus()
        let imageRect = NSRect(origin: NSZeroPoint, size: image.size)
        color.drawSwatch(in: imageRect)
        image.unlockFocus()
        return image
    }
    
    /// Generate button image with current accent color mask.
    /// - Parameter origin: button image.
    /// - Parameter mask: the mask image.
    class func combinImage(origin:NSImage, mask:NSImage) -> NSImage {
        let accentColor = NSColor.controlAccentColor
        let image = NSImage.init(size: origin.size, flipped: false) { (frameRect) -> Bool in
            origin.draw(in: frameRect)
            mask.lockFocus()
            accentColor.set()
            frameRect.fill(using: .sourceAtop)
            mask.unlockFocus()
            mask.draw(in: frameRect)
            return true
        }
        return image
    }
}
