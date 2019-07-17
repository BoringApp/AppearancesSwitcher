//
//  ViewController.swift
//  Apperance
//
//  Created by gm on 2019/7/15.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func loadView() {
        let appdelegate = NSApplication.shared.delegate as! AppDelegate
        let view = NSView.init(frame: appdelegate.window!.frame)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
