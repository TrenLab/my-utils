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
    @IBOutlet fileprivate var presenter: ContentPresenter! {
        didSet {
            presenter.view = self
        }
    }
    
    // MARK: - Object LifeCycle
    
    deinit {
        presenter = nil
    }
    
    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showStartViewController()
        
        _ = NotificationCenter.default.addObserver(forName: SideBarDidSelectTestNodeNotification) {notification in
            let item = notification.object as! Test
            self.presenter.show(testItem: item)
        }
    }
    
    // MARK: - Presentation
    
    func showStartViewController() {
        perform(testItem: presenter.start)
    }
    
    func perform(testItem item: Test) {
        removeChildViewControllers()
        presenter.show(testItem: item)
    }
}

// MARK: - ContentViewController ContentPresenterView

extension ContentViewController: ContentPresenterView {
    func display(test tst: Test) {
        performSegue(withIdentifier: tst.identifier, sender: nil)
    }
}
