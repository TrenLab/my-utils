//
//  NumberExtensionsTest.swift
//  MYUtils
//
//  Created by Damon Cricket on 30.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest

class NumberExtensionsTest: XCTestCase {
    
    // MARK: - Type
    
    func testType() {
        let number = NSNumber(value: true)
        XCTAssertTrue(number.isBool)
    }
}
