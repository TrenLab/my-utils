//
//  IntExtensionsTests.swift
//  MYUtils
//
//  Created by Damon Cricket on 05.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest

class IntExtensionsTests: XCTestCase {
    
    // MARK: - Random
    
    func testRandom() {
        for mock in getRandomData() {

            let randomMinMax = Int.random(min: mock.min, max: mock.max)
            XCTAssertTrue(randomMinMax >= mock.min && randomMinMax <= mock.max)

            if mock.min >= 0 {
                XCTAssertTrue(Int.random(n: mock.min) <= mock.min)
            }
            
            if mock.max >= 0 {
                XCTAssertTrue(Int.random(n: mock.max) <= mock.max)
            }

            let randomSign = Int.randomSign
            XCTAssertTrue(randomSign == -1 || randomSign == 1)
        }
    }
    
    // MARK: - Random Data
    
    func getRandomData() -> [(min: Int, max: Int)] {
        return [
            (min: 10, max: 1000),
            (min: 2432, max: 45342234),
            (min: 123, max: 3434),
            (min: -123, max: 0),
            (min: -3, max: 3434),
            (min: -100, max: 102334),
            (min: -1569, max: 9954583),
            (min: 0, max: 9954583)
        ]
    }
}
