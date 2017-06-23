//
//  SideBarItem.swift
//  MYUtils
//
//  Created by Damon Cricket on 18.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

// MARK: - TestItem

struct TestItem {

    let name: String
    
    let identifier: String
    
    let type: TestType
    
    // MARK: - Setup / Teardown
    
    init(name: String, type: TestType) {
        self.name = name
        self.identifier = type.identifier + ".storyboard.segue"
        self.type = type
    }
}
