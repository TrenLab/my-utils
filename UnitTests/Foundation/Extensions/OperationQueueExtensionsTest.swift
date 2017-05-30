//
//  OperationQueueExtensionsTest.swift
//  MYUtils
//
//  Created by Damon Cricket on 30.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest
@testable import MYUtils

class OperationQueueExtensionsTest: XCTestCase {
    
    let queue = OperationQueue()
    
    // MARK: - Main
    
    func testMainThreed() {
        let exp = expectation(description: "main thread expectation")

        PerformOnMainThreadSync {
            XCTAssertTrue(Thread.isMainThread)
        }

        PerformOnMainThreadAsync {
            XCTAssertTrue(Thread.isMainThread)
        }

        queue.addOperation {
            XCTAssertFalse(Thread.isMainThread)

            PerformOnMainThreadSync {
                XCTAssertTrue(Thread.isMainThread)
            }
        }
        
        queue.addOperation {
            XCTAssertFalse(Thread.isMainThread)
            PerformOnMainThreadAsync {
                XCTAssertTrue(Thread.isMainThread)
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    // MARK: - Background
    
    func testBackgroundThread() {
        let exp = expectation(description: "background thread expectation")
        
        PerformOnBackgroundThreadSync {
            XCTAssertTrue(Thread.isMainThread)
        }
        
        PerformOnBackgroundThreadAsync {
            XCTAssertFalse(Thread.isMainThread)
        }

        queue.addOperation {
            XCTAssertFalse(Thread.isMainThread)
            
            PerformOnBackgroundThreadSync {
                XCTAssertFalse(Thread.isMainThread)
            }
        }
        
        queue.addOperation {
            XCTAssertFalse(Thread.isMainThread)
            
            PerformOnBackgroundThreadAsync {
                XCTAssertFalse(Thread.isMainThread)
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
}
