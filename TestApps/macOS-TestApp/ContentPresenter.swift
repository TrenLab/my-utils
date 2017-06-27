//
//  TestControllerPresenter.swift
//  MYUtils
//
//  Created by Damon Cricket on 18.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

// MARK: - TestPresenter

class ContentPresenter: NSObject {
    
    
    weak var view: ContentPresenterView?
    
    // MARK: - Start
    
    lazy var start: Test = {
        return CommonTestGroup.start.rawValue
    }()
    
    // MARK: - Control
    
    func show(testItem item: Test) {
        view?.display(test: item)
    }
}
