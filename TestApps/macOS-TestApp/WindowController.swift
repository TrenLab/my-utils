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

    @IBOutlet weak var backButton: NSButton!
    
    @IBOutlet weak var resetButton: NSButton!
    
    var rootSplitViewController: RootSplitViewController {
        return self.contentViewController as! RootSplitViewController
    }
    
    // MARK: - 
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        _ = NotificationCenter.default.addObserver(forName: SideBarDidSelectNodeNotification) {notification in
            self.backButton.isEnabled = true
            self.resetButton.isEnabled = true
        }
        
        _ =  NotificationCenter.default.addObserver(forName: SideBarDidSelectInitialListNotification) {notification in
            self.backButton.isEnabled = false
            self.resetButton.isEnabled = false
        }
    }
    
    // MARK: - UIActions
    
    @IBAction func backTap(sender: Any) {
        rootSplitViewController.sideBarViewController.back()
    }
    
    @IBAction func resetTap(sender: Any) {
        rootSplitViewController.sideBarViewController.reset()
        rootSplitViewController.containerViewController.showStartViewController()
    }
}
