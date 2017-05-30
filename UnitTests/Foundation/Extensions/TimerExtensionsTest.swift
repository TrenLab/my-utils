//
//  TimerExtensionsTest.swift
//  MYUtils
//
//  Created by Damon Cricket on 30.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest
@testable import MYUtils

class TimerExtensionsTest: XCTestCase {

    // MARK: - Schedule
    
    func testDelay() {
        let exp = expectation(description: "timer expectation")
        
        let date = Date()
        let delay = 2.0
        _ = Timer.schedule(delay: delay) {timer in
            XCTAssertTrue(Date().timeIntervalSince(date) < delay + 1)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: delay, handler: nil)
    }
    
    func testInterval() {
        let exp = expectation(description: "timer expectation")
        
        let interval = 1.0
        let delay = 10.0
        var count = 0.0

        _ = Timer.schedule(repeatInterval: interval) {timer in
            count += 1
            
            if count == delay {
                timer?.invalidate()
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: delay) {_ in
            XCTAssertEqual(count, delay)
        }
    }
}
