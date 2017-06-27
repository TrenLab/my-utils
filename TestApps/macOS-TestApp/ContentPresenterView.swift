//
//  TestPresenterView.swift
//  MYUtils
//
//  Created by Damon Cricket on 23.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

// MARK: - ContentPresenterView

protocol ContentPresenterView: NSObjectProtocol {
    func display(test tst: Test)
}
