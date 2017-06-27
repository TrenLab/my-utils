//
//  SideBarViewController.swift
//  MYUtils
//
//  Created by Damon Cricket on 17.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Cocoa
import MYUtils

// MARK: - SideBar Notifications

let SideBarDidSelectInitialListNotification = NSNotification.Name(rawValue: "side.bar.did.select.initial.list")

let SideBarDidSelectNodeNotification = NSNotification.Name(rawValue: "side.bar.did.select.node")

let SideBarDidSelectTestNodeNotification = NSNotification.Name(rawValue: "side.bar.did.select.test.node")

// MARK: - SideBarViewController

class SideBarViewController: NSViewController {
    
    @IBOutlet fileprivate weak var sourceList: NSOutlineView!
    
    @IBOutlet fileprivate var presenter: SideBarPresenter! {
        didSet {
            presenter.view = self
        }
    }
    
    fileprivate var list: [SideBarNode]!

    // MARK: - Object LifeCycle
    
    deinit {
        presenter = nil
    }
    
    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.selectInitialList()
    }
    
    // MARK: - Control
    
    func reset() {
        presenter.selectInitialList()
    }
    
    func back() {
        presenter.selectInitialList()
    }
}

// MARK: - SideBarViewController NSOutlineViewDataSource

extension SideBarViewController: NSOutlineViewDataSource {
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        return list.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        return list[index]
    }
}

// MARK: - SideBarViewController NSOutlineViewDelegate

extension SideBarViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }
    
    func outlineView(_ outlineView: NSOutlineView, shouldSelectItem item: Any) -> Bool {
        return (item as! SideBarNode).isSelectable
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let node = item as! SideBarNode
        let item = node.item
        
        let view: SideBarTableCellView? = outlineView.make(withIdentifier: node.identifier, owner: self) as? SideBarTableCellView
        
        view?.adjust(withItem: item)
        return view
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        let node: SideBarNode = sourceList.item(atRow: sourceList.selectedRow) as! SideBarNode
        presenter.select(node: node)
    }
}

// MARK: - SideBarPresenterView

extension SideBarViewController: SideBarPresenterView {
    func display(testType type: Test) {
        NotificationCenter.default.post(name: SideBarDidSelectTestNodeNotification, object: type)
    }
    
    func display(initialNodeList list: [SideBarNode]) {
        display(nodeList: list, notification: SideBarDidSelectInitialListNotification)
    }
    
    func display(nodeList list: [SideBarNode]) {
        display(nodeList: list, notification: SideBarDidSelectNodeNotification)
    }
    
    func display(nodeList list: [SideBarNode], notification: NSNotification.Name) {
        self.list = list
        sourceList.reloadData()
        NotificationCenter.default.post(name: notification, object: nil)
    }
}
