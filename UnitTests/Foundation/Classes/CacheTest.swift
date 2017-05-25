//
//  CacheTest.swift
//  MYUtils
//
//  Created by Damon Cricket on 24.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest
@testable import MYUtils

class CacheTest: XCTestCase {
    
    var cache: Cache!
    
    var cacheNames: [String] = ["image", "storyboard", "view", "resources", "any"]
    
    var nonexistentCacheNames: [String] = ["code", "html", "java", "nib", "xib"]
    
    var cachesData: [String: [String]] = [:]
    
    // MARK: - SetUp / TearDown
    
    override func setUp() {
        super.setUp()
        
        for name in cacheNames {
            _ = Cache.create(withName: name)
        }

        let dataPerCacheCount = 10
        for name in cacheNames {
            let cache = Cache.with(name: name)
            var cacheData: [String] = []
            for dataIdx in 0...(dataPerCacheCount - 1) {
                let randomData = String.random(wihtLength: 10)
                cacheData.append(randomData)
                cache!["\(dataIdx)"] = randomData as AnyObject
            }
            cachesData[name] = cacheData
        }
    }

    // MARK: - Instance
    
    func testInstance() {
        for name in cacheNames {
            let cache = Cache.with(name: name)
            XCTAssertNotNil(cache)
            XCTAssertEqual(cache?.name, name)
            XCTAssertEqual(cache?.cache.name, name)
        }
    }

    // MARK: - Get
    
    func testGet() {
        for name in cacheNames {
            let cache = Cache.with(name: name)
            XCTAssertNotNil(cache)
        }
        
        for name in nonexistentCacheNames {
            let cache = Cache.with(name: name)
            XCTAssertNil(cache)
        }
    }
    
    // MARK: - Data
    
    func testData() {
        for name in cacheNames {
            let cache = Cache.with(name: name)
            let cacheData  = cachesData[name]
            for (idx, value) in cacheData!.enumerated() {
                let cacheValue = cache!["\(idx)"] as! String
                XCTAssertNotNil(cacheValue)
                XCTAssertEqual(cacheValue, value)
            }
        }
    }
    
    // MARK: - Clear
    
    func testClearAll() {
        for name in cacheNames {
            let cache = Cache.with(name: name)
            cache?.clear()
            let cacheData = cachesData[name]
            for (idx, _) in cacheData!.enumerated() {
                let cacheValue = cache!["\(idx)"] as? String
                XCTAssertNil(cacheValue)
            }
        }
    }
    
    func testClear() {
        for name in cacheNames {
            let cache = Cache.with(name: name)
            let cacheData = cachesData[name]
            for (idx, _) in cacheData!.enumerated() {
                cache!["\(idx)"] = nil
                let cacheValue = cache!["\(idx)"] as? String
                XCTAssertNil(cacheValue)
            }
        }
    }
}
