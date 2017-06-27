//
//  SideBarPresenterView.swift
//  MYUtils
//
//  Created by Damon Cricket on 21.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

// MARK: - SideBarPresenterView

protocol SideBarPresenterView: NSObjectProtocol {

    func display(initialNodeList list: [SideBarNode])

    func display(testType type: Test)
    
    func display(nodeList list: [SideBarNode])
}
