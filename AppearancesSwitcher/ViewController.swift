//
//  ViewController.swift
//  Apperance
//
//  Created by gm on 2019/7/15.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let alertLabel: NSTextField = {
        let field = NSTextField()
        field.alignment = .center
        field.backgroundColor = .clear
        field.isEditable = false
        field.isBezeled = false
        field.font = NSFont.systemFont(ofSize: 12)
        field.stringValue = "Register finished, Now you can close the app"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    override func loadView() {
        
        let view = NSView.init(frame: NSMakeRect(0, 0, 320, 300))
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.alertLabel)
        
        self.alertLabel.frame = NSMakeRect(0, 0, 300, 20)
    }
}
