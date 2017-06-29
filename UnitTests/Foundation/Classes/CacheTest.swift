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
    
    // MARK: - SetUp / TearDown
    
    override func setUp() {
        super.setUp()
        
        createCaches()
    }

    // MARK: - Instance
    
    func testInstance() {
        for mock in getData() {
            let name = mock.name
            let cache = Cache.with(name: name)

            XCTAssertNotNil(cache)
            XCTAssertEqual(cache!.name, name)
            XCTAssertEqual(cache!.cache.name, name)
        }
    }

    // MARK: - Get
    
    func testGet() {
        for mock in getData() {
            let createdCache = Cache.create(withName: mock.name)
            let obtainedCache = Cache.with(name: mock.name)!

            XCTAssertEqual(createdCache, obtainedCache)
        }
    }
    
    // MARK: - Data
    
    func testData() {
        for mock in getData() {
            let cache = Cache.with(name: mock.name)
            
            for (key, value) in mock.data {
                let cachedValue = cache?[key] as? String
                XCTAssertNotNil(cachedValue)
                XCTAssertEqual(cachedValue, value)
            }
        }
    }
    
    // MARK: - Clear
    
    func testClearAllCaches() {
        for mock in getData() {
            let cache = Cache.with(name: mock.name)
            for (key, _) in mock.data {
                let cacheValue = cache?[key] as? String
                XCTAssertNotNil(cacheValue)
            }
        }
        
        Cache.clear()
        
        for mock in getData() {
            let cache = Cache.with(name: mock.name)
            for (key, _) in mock.data {
                let cacheValue = cache?[key] as? String
                XCTAssertNil(cacheValue)
            }
        }
    }
    
    func testClearCache() {
        for mock in getData() {
            let cache = Cache.with(name: mock.name)
            
            for (key, _) in mock.data {
                let cacheValue = cache?[key] as? String
                XCTAssertNotNil(cacheValue)
            }
            
            cache?.clear()
            
            for (key, _) in mock.data {
                let cacheValue = cache?[key] as? String
                XCTAssertNil(cacheValue)
            }
        }
    }
    
    func testClearCacheValues() {
        for mock in getData() {
            let cache = Cache.with(name: mock.name)
            for (key, _) in mock.data {
                XCTAssertNotNil(cache?[key])
                
                cache?[key] = nil
                
                XCTAssertNil(cache?[key])
            }
        }
    }

    
    // MARK: - Data
    
    func createCaches() {
        for mock in getData() {
            let cache: Cache = Cache.create(withName: mock.name)
            for (key, value) in mock.data {
                cache[key] = value as AnyObject
            }
        }
    }
    
    func getData() -> [(name: String, data: [String: String])] {
        return getExistedCacheNames().map {name -> (name: String, data: [String: String]) in
            var data: (name: String, data: [String: String])
            data.name = name
            data.data = [:]
            
            let dataPerCacheCount: Int = 10
            
            for dataIdx in 0...(dataPerCacheCount - 1) {
                data.data["\(dataIdx)"] = "\(dataIdx) cache value"
            }
            return data
        }
    }
    
    func getExistedCacheNames() -> [String] {
        return ["image", "storyboard", "view", "resources", "any"]
    }
    
    func getNonexistentCacheNames() -> [String] {
        return ["code", "html", "java", "nib", "xib"]
    }
}
