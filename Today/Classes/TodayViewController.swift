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
        var button: NSButton
        if let lightImage = NSImage(named: "button_light") {
            button = NSButton(title: "Light", image: lightImage, target: nil, action: nil)
        } else {
            var tintImage = NSImage(size: NSMakeSize(70, 48))
            tintImage = tintImage.tint(color: NSColor.blue)
            button = NSButton(title: "Light", image: tintImage, target: nil, action: nil)
        }
        
        button.isBordered = false
        button.layer?.backgroundColor = NSColor.clear.cgColor
        //        button.layer?.cornerRadius = radius
        button.bezelStyle = NSButton.BezelStyle.regularSquare
        button.imagePosition = NSControl.ImagePosition.imageAbove
        return button
    }()
    
    let darkButton: NSButton = {
        var button: NSButton
        if let darkImage = NSImage(named: "button_dark") {
            button = NSButton(title: "Dark", image: darkImage, target: nil, action: nil)
        } else {
            var tintImage = NSImage(size: NSMakeSize(70, 48))
            tintImage = tintImage.tint(color: NSColor.blue)
            button = NSButton(title: "Dark", image: tintImage, target: nil, action: nil)
        }
        
        button.isBordered = false
        button.layer?.backgroundColor = NSColor.clear.cgColor
        button.bezelStyle = NSButton.BezelStyle.regularSquare
        button.imagePosition = NSControl.ImagePosition.imageAbove
        return button
    }()
    
    let containerStackView: NSStackView = {
        let stackView = NSStackView()
        stackView.alignment = .centerX
        stackView.orientation = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 18
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
        self.view.heightAnchor.constraint(equalToConstant: 120).isActive = true;
        
        let margin: CGFloat = 8
        
        self.containerStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: margin).isActive = true
        self.containerStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -margin).isActive = true;
        self.containerStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        super.updateViewConstraints()
        
        self.syncAppearanceType()
    }
    
    func syncAppearanceType() {
        let currentTheme = SLSGetAppearanceThemeLegacy()
        switch currentTheme {
        case .light:
            self.lightButton.isBordered = true
            self.darkButton.isBordered = false
        case .dark:
            self.lightButton.isBordered = false
            self.darkButton.isBordered = true
        default:
            self.lightButton.isBordered = false
            self.darkButton.isBordered = false
        }
    }

    // MARK: Button Action
    
    @objc func lightButtonClicked() {
        let currentTheme = SLSGetAppearanceThemeLegacy()
        if currentTheme != AppearanceType.light {
            SLSSetAppearanceThemeLegacy(.light)
        }
        
        syncAppearanceType()
    }
    
    @objc func darkButtonClicked() {
        let currentTheme = SLSGetAppearanceThemeLegacy()
        if currentTheme != AppearanceType.dark {
            SLSSetAppearanceThemeLegacy(.dark)
        }
        
        syncAppearanceType()
    }
    
    // MARK: NotificationCenter
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(.noData)
    }
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInset: NSEdgeInsets) -> NSEdgeInsets {
        return NSEdgeInsetsZero
    }
}
