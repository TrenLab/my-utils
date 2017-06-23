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
    var sideBarViewController: SideBarViewController {
        return splitViewItems[0].viewController as! SideBarViewController
    }
    
    var containerViewController: ContentViewController {
        return splitViewItems[1].viewController as! ContentViewController
    }
}
