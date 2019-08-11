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
    
    // MARK: - Properties
    
    let lightView:ToggleView = {
        
        // TODO: Use 'NSColor.currentControlTint' to set correct origin image.
        
        let lightImage = NSImage.combinImage(origin: NSImage(named: "AppearanceLight_Normal")!, mask: NSImage(named: "selectionColor_mask_Normal")!)
        return ToggleView(title: "Light", image: lightImage, target: nil, action: nil)
    }()
    
    let darkView: ToggleView = {
        let darkImage = NSImage.combinImage(origin: NSImage(named: "AppearanceDark_Normal")!, mask: NSImage(named: "selectionColor_mask_Normal")!)
        return ToggleView(title: "Dark", image: darkImage, target: nil, action: nil)
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
    
    // MARK: - Life cycle
    
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
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
        self.syncAppearanceType()
    }
    
    // MARK: - Internal methods
    
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
        //#if DEBUG
        //        self.lightView.imageButton.isSelected = true
        //        self.darkView.imageButton.isSelected = false
        //#else
        let currentTheme = SLSGetAppearanceThemeLegacy()
        if currentTheme != AppearanceType.light {
            SLSSetAppearanceThemeLegacy(.light)
        }
        syncAppearanceType()
        //#endif
    }
    
    @objc func darkButtonClicked() {
        //#if DEBUG
        //        self.lightView.imageButton.isSelected = false
        //        self.darkView.imageButton.isSelected = true
        //#else
        let currentTheme = SLSGetAppearanceThemeLegacy()
        if currentTheme != AppearanceType.dark {
            SLSSetAppearanceThemeLegacy(.dark)
        }
        syncAppearanceType()
        //#endif
    }
    
    // MARK: - NotificationCenter
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(.noData)
    }
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInset: NSEdgeInsets) -> NSEdgeInsets {
        return NSEdgeInsetsZero
    }
}

// FIXME: TodayViewController's appearance not change when user change the appearance by system.
