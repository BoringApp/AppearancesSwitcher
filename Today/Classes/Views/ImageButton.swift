//
//  ImageButton.swift
//  Today
//
//  Created by gm on 2019/7/25.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa

class ImageButton:NSButton {
    
    public let borderWidth: CGFloat = 2
    
    public var isSelected: Bool = false {
        didSet {
            if self.isSelected {
                self.layer?.borderWidth = 2
            } else {
                self.layer?.borderWidth = 0
            }
        }
    }
    
    override init(frame frameRect: NSRect) {
        
        super.init(frame: frameRect)
        
        self.cell = SwitchCell()
        self.wantsLayer = true
        self.bezelStyle = .disclosure
        self.wantsLayer = true
        self.isBordered = false
        self.imagePosition = .imageOnly
        self.layer?.cornerRadius = 7
        self.layer?.masksToBounds = true
        self.layer?.borderColor = NSColor.controlAccentColor.cgColor
        (self.cell as? NSButtonCell)?.highlightsBy = .contentsCellMask
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidChangeEffectiveAppearance() {
        super.viewDidChangeEffectiveAppearance()
        
        // layout() or viewDidChangeEffectiveAppearance()
        // https://developer.apple.com/documentation/appkit/supporting_dark_mode_in_your_interface
        self.layer?.borderColor = NSColor.controlAccentColor.cgColor
    }

}
