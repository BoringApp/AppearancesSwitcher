//
//  SwitchCell.swift
//  Today
//
//  Created by gm on 2019/7/25.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa

class SwitchCell: NSButtonCell {
    
    override func highlight(_ flag: Bool, withFrame cellFrame: NSRect, in controlView: NSView) {
        if let isSelected = (controlView as? ImageButton)?.isSelected, let borderWidth = (controlView as? ImageButton)?.borderWidth{
            if isSelected {
                controlView.layer?.borderWidth = (flag ? 0 : borderWidth)
            } else {
                controlView.layer?.borderWidth = (flag ? borderWidth : 0)
            }
        }
    }
}
