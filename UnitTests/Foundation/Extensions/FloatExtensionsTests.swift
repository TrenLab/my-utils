//
//  FloatExtensionsTests.swift
//  MYUtils
//
//  Created by Damon Cricket on 05.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest

class FloatExtensionsTests: XCTestCase {
    
    // MARK: - Random
    
    func testExample() {
        for mock in getRandomData() {
            let randomMinMax = Float.random(min: mock.min, max: mock.max)
            XCTAssertTrue(randomMinMax >= mock.min && randomMinMax <= mock.max)
            
            let dicimal = abs(randomMinMax.truncatingRemainder(dividingBy: 1.0))
            XCTAssertTrue(dicimal >= 0.0 && dicimal < 1.0)
            
            let randomRange = Float.random
            XCTAssertTrue(randomRange >= 0.0 && randomRange <= 1.0)
            
            let randomSign = Float.randomSign
            XCTAssertTrue(randomSign == -1.0 || randomSign == 1.0)
        }
    }
    
    // MARK: - Random Data
    
    func getRandomData() -> [(min: Float, max: Float)] {
        return [
            (min: 10.0, max: 1000.0),
            (min: 2432.0, max: 45342234.0),
            (min: 123.0123, max: 3434.505),
            (min: -123.0123, max: 0.505),
            (min: -3.12, max: 3434.505),
            (min: -100.3432, max: 102334.12),
            (min: -1569.345431, max: 9954583.143),
            (min: 0.345431, max: 9954583.143)
        ]
    }
}
