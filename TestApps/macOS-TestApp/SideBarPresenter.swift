//
//  SideBarPresenter.swift
//  MYUtils
//
//  Created by Damon Cricket on 20.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Cocoa

// MARK: - SideBarPresenter

class SideBarPresenter: NSObject {
    
    weak var view: SideBarPresenterView?
    
    // MARK: - Nodes
    
    lazy var nodes: [SideBarNode] = {[unowned self] in
        return [
            SideBarHeaderNode(identifier: "header.cell", item: SideBarItem(title: "Test Menu")),
            SideBarParentNode(identifier: "item.cell", item: SideBarItem(title: "StroryboardSegue"), childItems: self.storyboardSegueNodes),
            SideBarParentNode(identifier: "item.cell", item: SideBarItem(title: "ViewController"), childItems: self.viewControllerNodes),
            SideBarParentNode(identifier: "item.cell", item: SideBarItem(title: "View"), childItems: self.viewNodes),
            SideBarParentNode(identifier: "item.cell", item: SideBarItem(title: "Image"), childItems: self.imageNodes)
        ]
    }()
    
    // MARK: - StoryboardSegue
    
    lazy var storyboardSegueNodes: [SideBarNode] = {
        return [
            SideBarHeaderNode(identifier: "header.cell", item: SideBarItem(title: "StroruboardSegue Menu")),
            SideBarTestNode(test: StoryboardTestGroup.dismiss.rawValue, identifier: "item.cell", item: SideBarItem(title: "Dismiss")),
            SideBarTestNode(test: StoryboardTestGroup.showHide.rawValue, identifier: "item.cell", item: SideBarItem(title: "Show / Hide"))
        ]
    }()
    
    // MARK: - ViewController
    
    lazy var viewControllerNodes: [SideBarNode] = {
        return []
    }()
    
    // MARK: - View
    
    lazy var viewNodes: [SideBarNode] = {
        return []
    }()
    
    // MARK: = Image
    
    lazy var imageNodes: [SideBarNode] = {
        return []
    }()
    
    // MARK: - Control
    
    func selectInitialList() {
        view?.display(initialNodeList: nodes)
    }
    
    func select(node nd: SideBarNode) {
        switch nd.type {
        case .parent:
            let childs = nd.childs
            if !childs.isEmpty {
                view?.display(nodeList: childs)
            }
        case .test(let value):
            view?.display(testType: value)
        default:
            break
        }
    }
    
    func select(nodeList list: [SideBarNode]) {
        view?.display(nodeList: list)
    }
}
