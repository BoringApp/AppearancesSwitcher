//
//  TodayViewController.swift
//  Today
//
//  Created by gm on 2019/7/16.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa
import NotificationCenter

class TodayViewController: NSViewController, NCWidgetProviding {
    let lightButton = NSButton(title: "Light", target: self, action: #selector(TodayViewController.lightButtonClicked))
    let darkButton = NSButton(title: "Dark", target: self, action: nil)
    var containerStackView: NSStackView?
    
    override var nibName: NSNib.Name? {
        return NSNib.Name("TodayViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.setValue(NSColor.red, forKey: "backgroundColor")
        
        self.containerStackView = NSStackView(views: [lightButton, darkButton])
        self.containerStackView?.alignment = .centerX
        self.containerStackView?.orientation = .horizontal
        self.containerStackView?.distribution = .equalSpacing
        
        self.containerStackView!.setValue(NSColor.yellow, forKey: "backgroundColor")
        self.view.addSubview(self.containerStackView!)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.widthAnchor.constraint(equalToConstant: 320).isActive = true;
        self.view.heightAnchor.constraint(equalToConstant: 180).isActive = true;
        
        let margin: CGFloat = 8
        
        self.containerStackView!.translatesAutoresizingMaskIntoConstraints = false
        self.containerStackView!.topAnchor.constraint(equalTo: self.view.topAnchor, constant: margin).isActive = true
        self.containerStackView!.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -margin).isActive = true;
        self.containerStackView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        super.updateViewConstraints()
    }
    
    // MARK: Button Action
    @objc func lightButtonClicked() {
//        print(type(of: sender));
        print("attach")
    }
    
    // MARK: NotificationCenter
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(.noData)
    }
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInset: NSEdgeInsets) -> NSEdgeInsets {
        return NSEdgeInsetsZero
    }
}
