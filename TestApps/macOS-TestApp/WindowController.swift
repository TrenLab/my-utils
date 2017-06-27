//
//  WindowController.swift
//  MYUtils
//
//  Created by Damon Cricket on 17.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Cocoa

// MARK: - WindowController

class WindowController: NSWindowController {
    
    // MARK: - Buttons
    
    @IBOutlet private weak var backButton: NSButton!
    @IBOutlet private weak var resetButton: NSButton!

    // MARK: - Items
    
    private var rootSplitViewController: RootSplitViewController {
        return contentViewController as! RootSplitViewController
    }
    
    // MARK: - ViewController LifeCycle
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        _ = NotificationCenter.default.addObserver(forName: SideBarDidSelectNodeNotification) {notification in
            self.backButton.isEnabled = true
        }
        
        _ =  NotificationCenter.default.addObserver(forName: SideBarDidSelectInitialListNotification) {notification in
            self.setButtons(enabled: false)
        }
        
        _ = NotificationCenter.default.addObserver(forName: SideBarDidSelectTestNodeNotification) {notification in
            self.setButtons(enabled: true)
        }
    }
    
    // MARK: - UIActions
    
    @IBAction func backButtonTap(sender: Any) {
        rootSplitViewController.sideBarViewController.back()
        setButtons(enabled: false)
    }
    
    @IBAction func resetButtonTap(sender: Any) {
        rootSplitViewController.contentViewController.showStartViewController()
        resetButton.isEnabled = false
    }

    private func setButtons(enabled isEnabled: Bool) {
        self.backButton.isEnabled  = isEnabled
        self.resetButton.isEnabled = isEnabled
    }
}
