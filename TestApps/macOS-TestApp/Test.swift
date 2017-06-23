//
//  Test.swift
//  MYUtils
//
//  Created by Damon Cricket on 22.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

// MARK: - TestType

struct TestType {
    fileprivate(set) var identifier: String = ""
    
    // MARK: - Object LifeCycle
    
    init(identifier: String) {
        self.identifier = identifier
    }
}

// MARK: - TestType RawRepresentable

extension TestType: RawRepresentable {
    typealias RawValue = String
    
    var rawValue: RawValue {
        set {
            identifier = rawValue
        }
        get {
            return identifier
        }
    }
    
    init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

// MARK: - TestType Hashable

extension TestType: Hashable {
    var hashValue: Int {
        return identifier.hash
    }
}

// MARK: - TestType Equatable

extension TestType: Equatable {
    static func ==(lhs: TestType, rhs: TestType) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

// MARK: - TestType ExpressibleByStringLiteral

extension TestType: ExpressibleByStringLiteral {
    typealias ExtendedGraphemeClusterLiteralType = String
    typealias StringLiteralType = String

    
    init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }
    init(extendedGraphemeClusterLiteral value: String) {
        self.init(stringLiteral: value)
    }
    
    init(stringLiteral value: String) {
        identifier = value
    }
}

// MARK: - Types

enum Common: TestType {
    case start = ""
}

enum StoryboardTestType: TestType {
    case dismiss = "dismiss"
    case showHide = "show.hide"
    
    static let types: [StoryboardTestType] = {
        return [.dismiss, .showHide]
    }()
}

enum ViewControllerTestType: TestType {
    case alert = "alert"
    case viewController = "view.conroller"
    
    static let types: [ViewControllerTestType] = {
        return [.alert, .viewController]
    }()
}

enum ViewTestType: TestType {
    case collectionView = "collection.view"
    case scrollView = "scroll.view"
    case view = "view"
    case tableView = "table.view"
    
    static let types: [ViewTestType] = {
        return [.collectionView, .scrollView, .view, .tableView]
    }()
}

enum ImageTestType: TestType {
    case imageView = "image.view"
    case image = "image"
    
    static let types: [ImageTestType] = {
        return [.imageView, .image]
    }()
}
