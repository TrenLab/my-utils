//
//  SideBatTableCellView.swift
//  MYUtils
//
//  Created by Damon Cricket on 20.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Cocoa

// MARK: - SideBarTableCellView

class SideBarTableCellView: NSTableCellView {
    
    // MARK: - Adjust
    
    func adjust(withItem item: SideBarItem) {
        textField?.stringValue = item.title
    }
}
