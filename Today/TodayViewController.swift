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
    let lightButton:NSButton = {
        var tintImage = NSImage(size: NSMakeSize(70, 48))
        tintImage = tintImage.tint(color: NSColor.blue)
        let button = NSButton(title: "Light", image: tintImage, target: nil, action: nil)
        button.imagePosition = NSControl.ImagePosition.imageAbove
        button.setButtonType(.toggle)
        return button
    }()
    
    let darkButton: NSButton = {
        var tintImage = NSImage(size: NSMakeSize(66, 38))
        tintImage = tintImage.tint(color: NSColor.red)
        let button = NSButton(title: "Dark",image: tintImage, target: nil, action: nil)
        return button
    }()
    
    let containerStackView: NSStackView = {
        let stackView = NSStackView()
        stackView.alignment = .centerX
        stackView.orientation = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func loadView() {
        self.view = NSView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lightButton.target = self
        self.lightButton.action = #selector(TodayViewController.lightButtonClicked)
        
        self.darkButton.target = self
        self.darkButton.action = #selector(TodayViewController.darkButtonClicked)
                
        self.containerStackView.addView(lightButton, in: .center)
        self.containerStackView.addView(darkButton, in: .center)
        self.view.addSubview(self.containerStackView)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.widthAnchor.constraint(equalToConstant: 320).isActive = true;
        self.view.heightAnchor.constraint(equalToConstant: 180).isActive = true;
        
        let margin: CGFloat = 8
        
        self.containerStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: margin).isActive = true
        self.containerStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -margin).isActive = true;
        self.containerStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        super.updateViewConstraints()
    }
    
    // MARK: Button Action
    
    @objc func lightButtonClicked() {
        let currentTheme = SLSGetAppearanceThemeLegacy()
        if (currentTheme != AppearanceType.light) {
            SLSSetAppearanceThemeLegacy(.light)
        }
    }
    
    @objc func darkButtonClicked() {
        let currentTheme = SLSGetAppearanceThemeLegacy()
        if (currentTheme != AppearanceType.dark) {
            SLSSetAppearanceThemeLegacy(.dark)
        }
    }
    
    // MARK: NotificationCenter
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(.noData)
    }
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInset: NSEdgeInsets) -> NSEdgeInsets {
        return NSEdgeInsetsZero
    }
}
