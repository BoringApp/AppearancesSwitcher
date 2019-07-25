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
    let lightView:ToggleView = {
        
        // button size : 67 * 44
        
        var button: ToggleView
        if let lightImage = NSImage(named: "AppearanceLight_Normal") {
            button = ToggleView(title: "Light", image: lightImage, target: nil, action: nil)
        } else {
            var tintImage = NSImage(size: NSMakeSize(67, 44))
            tintImage = tintImage.tint(color: NSColor.blue)
            button = ToggleView(title: "Light", image: tintImage, target: nil, action: nil)            
        }
        return button
    }()
    
    let darkView: ToggleView = {
        var button: ToggleView
        if let darkImage = NSImage(named: "AppearanceDark_Normal") {
            button = ToggleView(title: "Dark", image: darkImage, target: nil, action: nil)
        } else {
            var tintImage = NSImage(size: NSMakeSize(67, 44))
            tintImage = tintImage.tint(color: NSColor.blue)
            button = ToggleView(title: "Dark", image: tintImage, target: nil, action: nil)
        }
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
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.heightAnchor.constraint(equalToConstant: 90).isActive = true;
        
        self.lightView.imageButton.target = self
        self.lightView.imageButton.action = #selector(TodayViewController.lightButtonClicked)
        
        self.darkView.imageButton.target = self
        self.darkView.imageButton.action = #selector(TodayViewController.darkButtonClicked)
        
        self.containerStackView.addView(lightView, in: .center)
        self.containerStackView.addView(darkView, in: .center)
        self.view.addSubview(self.containerStackView)
        
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
            self.lightView.imageButton.isSelected = true
            self.darkView.imageButton.isSelected = false
        case .dark:
            self.lightView.imageButton.isSelected = false
            self.darkView.imageButton.isSelected = true
        default:
            self.lightView.imageButton.isSelected = false
            self.darkView.imageButton.isSelected = false
        }
    }

    // MARK: Button Action
    
    @objc func lightButtonClicked() {
#if DEBUG
        self.lightView.imageButton.isSelected = true
        self.darkView.imageButton.isSelected = false
#else
        let currentTheme = SLSGetAppearanceThemeLegacy()
        if currentTheme != AppearanceType.light {
            SLSSetAppearanceThemeLegacy(.light)
        }
        syncAppearanceType()
#endif
    }
    
    @objc func darkButtonClicked() {
#if DEBUG
        self.lightView.imageButton.isSelected = false
        self.darkView.imageButton.isSelected = true
#else
        let currentTheme = SLSGetAppearanceThemeLegacy()
        if currentTheme != AppearanceType.dark {
            SLSSetAppearanceThemeLegacy(.dark)
        }
        syncAppearanceType()
#endif
    }
    
    // MARK: NotificationCenter
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(.noData)
    }
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInset: NSEdgeInsets) -> NSEdgeInsets {
        return NSEdgeInsetsZero
    }
}
