//
//  ViewController.swift
//  macOS-TestApp
//
//  Created by Damon Cricket on 25.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Cocoa

// MARK: - RootSplitViewController

class RootSplitViewController: NSSplitViewController {
    
    // MARK: - Items
    
    var sideBarViewController: SideBarViewController {
        return splitViewItems[0].viewController as! SideBarViewController
    }
    
    var contentViewController: ContentViewController {
        return splitViewItems[1].viewController as! ContentViewController
    }

    // MARK: - Private Vars
    
    private var test: Test?

    // MARK: - Object LifeCycle
    
    deinit {
        test = nil
    }
    
    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = NotificationCenter.default.addObserver(forName: SideBarDidSelectNodeNotification) {notification in
            
        }
        
        _ =  NotificationCenter.default.addObserver(forName: SideBarDidSelectInitialListNotification) {notification in
        }
        
        _ = NotificationCenter.default.addObserver(forName: SideBarDidSelectTestNodeNotification) {notification in
            self.test = notification.object as? Test
        }
    }
}
