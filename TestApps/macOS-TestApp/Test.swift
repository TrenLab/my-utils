//
//  Test.swift
//  MYUtils
//
//  Created by Damon Cricket on 22.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

// MARK: - TestType

struct Test {
    
    
    fileprivate(set) var identifier: String
}

// MARK: - Hashable

extension Test: Hashable {
    
    
    var hashValue: Int {
        return identifier.hash
    }
}

// MARK: - Equatable

extension Test: Equatable {
    
    
    static func ==(lhs: Test, rhs: Test) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

// MARK: - ExpressibleByStringLiteral

extension Test: ExpressibleByStringLiteral {

    
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
