//
//  ContainerViewController.swift
//  MYUtils
//
//  Created by Damon Cricket on 18.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Cocoa

// MARK: - ContentViewController

class ContentViewController: NSViewController {
    
    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStartViewController()
    }
    
    // MARK: - Presentation
    
    func showStartViewController() {
        performSegue(withIdentifier: "start.storyboard.segue", sender: nil)
    }
    
    func show(item: TestItem) {
        performSegue(withIdentifier: item.identifier, sender: nil)
    }
}
