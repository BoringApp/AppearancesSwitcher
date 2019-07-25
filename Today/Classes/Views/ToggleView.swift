//
//  ImageButton.swift
//  Today
//
//  Created by gm on 2019/7/21.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa

class ToggleView: NSView {

    public let imageButton: ImageButton = ImageButton()
    
    public let titleField: NSTextField = {
        let field = NSTextField()
        field.alignment = .center
        field.backgroundColor = .clear
        field.isEditable = false
        field.isBezeled = false
        field.font = NSFont.systemFont(ofSize: 12)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public init (title: String, image: NSImage, target: AnyObject?, action: Selector?) {
        super.init(frame: NSZeroRect)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleField.stringValue = title
        self.imageButton.image = image
        self.imageButton.target = target
        self.imageButton.action = action
        
        self.addSubview(self.imageButton)
        self.addSubview(self.titleField)
        
        let margin: CGFloat = 10
        self.imageButton.topAnchor.constraint(equalTo: self.topAnchor, constant: margin).isActive = true
        self.imageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageButton.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.imageButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.titleField.topAnchor.constraint(equalTo: self.imageButton.bottomAnchor, constant: 6).isActive = true
        self.titleField.leftAnchor.constraint(equalTo: self.imageButton.leftAnchor).isActive = true
        self.titleField.rightAnchor.constraint(equalTo: self.imageButton.rightAnchor).isActive = true
        self.updateConstraints()
    }
}
