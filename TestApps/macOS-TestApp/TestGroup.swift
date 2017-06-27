//
//  Tests.swift
//  MYUtils
//
//  Created by Damon Cricket on 27.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

// MARK: - Common

enum CommonTestGroup: Test, TestGroup {
    
    
    case start = "start"
    
    
    var identifier: String {
        return "common"
    }
    
    static var tests: [Test] {
        return [
            CommonTestGroup.start.rawValue
        ]
    }
}

// MARK: - StoryboardGroup

enum StoryboardTestGroup: Test, TestGroup {
    
    
    case dismiss = "dismiss"
    
    case showHide = "show.hide"
    
    
    var identifier: String {
        return "storyboard"
    }
    
    static var tests: [Test] {
        return [
            StoryboardTestGroup.dismiss.rawValue,
            StoryboardTestGroup.showHide.rawValue
        ]
    }
}

// MARK: - ViewControllerGroup

enum ViewControllerTestGroup: Test, TestGroup {
    
    
    case alert = "alert"
    
    case viewController = "view.conroller"
    
    
    var identifier: String {
        return "view.controller"
    }
    
    static var tests: [Test] {
        return [
            ViewControllerTestGroup.alert.rawValue,
            ViewControllerTestGroup.viewController.rawValue
        ]
    }
}

// MARK: - ViewGroup

enum ViewTestGroup: Test, TestGroup {
    
    
    case collectionView = "collection.view"
    
    case scrollView = "scroll.view"
    
    case view = "view"
    
    case tableView = "table.view"
    
    
    var identifier: String {
        return "view"
    }
    
    static var tests: [Test] = {
        return [
            ViewTestGroup.collectionView.rawValue,
            ViewTestGroup.scrollView.rawValue,
            ViewTestGroup.view.rawValue,
            ViewTestGroup.tableView.rawValue
        ]
    }()
}

// MARK: - ViewGroup

enum ImageTestGroup: Test, TestGroup {

    
    case imageView = "image.view"
    
    case image = "image"
    

    var identifier: String {
        return "image"
    }
    
    static var tests: [Test] = {
        return [
            ImageTestGroup.imageView.rawValue,
            ImageTestGroup.image.rawValue
        ]
    }()
}

// MARK: - TestGroup

protocol TestGroup {
    
    
    var identifier: String {get}
    
    static var tests: [Test] {get}
}
