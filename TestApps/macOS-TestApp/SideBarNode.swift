//
//  SideBarNode.swift
//  MYUtils
//
//  Created by Damon Cricket on 21.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Cocoa

// MARK: - SideBarNodeType

enum SideBarNodeType {
    
    case header
    
    case parent
    
    case test(Test)
}

// MARK: - SideBarNode

class SideBarNode {
    
    let type: SideBarNodeType
    
    let identifier: String
    
    let item: SideBarItem
    
    let isSelectable: Bool

    let childs: [SideBarNode]
    
    // MARK: - Object LifeCycle
    
    init(type: SideBarNodeType, identifier: String, item: SideBarItem, childs: [SideBarNode]) {
        self.type = type
        self.identifier = identifier
        self.item = item
        
        if case .header = self.type {
            self.isSelectable = false
        } else {
            self.isSelectable = true
        }
        
        self.childs = childs
    }
}

// MARK: - SideBarHeaderNode

class SideBarHeaderNode: SideBarNode {
    
    // MARK: - Object LifeCycle
    
    convenience init(identifier: String, item: SideBarItem) {
        self.init(type: .header, identifier: identifier, item: item, childs: [])
    }
}

// MARK: - SideBarCellNode

class SideBarParentNode: SideBarNode {
    
    // MARK: - Object LifeCycle
    
    convenience init(identifier: String, item: SideBarItem, childItems: [SideBarNode]) {
        self.init(type: .parent, identifier: identifier, item: item, childs: childItems)
    }
}

// MARK: - SideBarTestNode

class SideBarTestNode: SideBarNode {
    
    // MARK: - Object LifeCycle
    
    convenience init(test: Test, identifier: String, item: SideBarItem) {
        self.init(type: .test(test), identifier: identifier, item: item, childs: [])
    }
}
