//
//  ArrayExtensionsClass.swift
//  MYUtils
//
//  Created by Damon Cricket on 30.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest

class ArrayExtensionsTest: XCTestCase {
    
    // MARK: - Operators
    
    func testSum() {
        for mock in getSumData() {
            let firstResult = mock.first + mock.second
            
            var secondResult = mock.first
            secondResult += mock.second
            
            XCTAssertEqual(firstResult, mock.result)
            XCTAssertEqual(secondResult, mock.result)
        }
    }
    
    // MARK: - Enumerate
    
    func testEnum() {
        for mock in getEnumData() {
            
            var lastIDX: Int = 0
            
            mock.enumerate {idx, value in
                XCTAssertEqual(value, mock[idx])
                lastIDX = idx
            }
            XCTAssertTrue(lastIDX == (mock.count - 1))
        }
    }
    
    func testMake() {
        for (source, multiplier, result) in getMakeData() {
            let rez = source.make {_, value in
                return value * multiplier
            }
            XCTAssertEqual(rez, result)
        }
    }
    
    // MARK: - Remove
    
    func testRemove() {
        for mock in getRemoveData() {
            var source = mock.source
            for removeElement in mock.remove {
                source.remove(element: removeElement)
            }
            XCTAssertEqual(source, mock.result)
        }
    }
    
    // MARK: - Data
    
    func getSumData() -> [(first: [Int], second: [Int], result: [Int])] {
        return [
            (first: [-3, -2], second: [-1, 0], result: [-3, -2, -1, 0]),
            (first: [1, 2], second: [3, 4], result: [1, 2, 3, 4]),
            (first: [1, 2], second: [3, 4], result: [1, 2, 3, 4]),
            (first: [5, 6], second: [7, 8], result: [5, 6, 7, 8])
        ]
    }
    
    func getEnumData() -> [[String]] {
        return [
            ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
            ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19"],
            ["20", "21", "22", "23", "24", "25", "26", "27", "28", "29"],
            ["30", "31", "32", "33", "34", "35", "36", "37", "38", "39"]
        ]
    }
    
    func getMakeData() -> [(source: [Int], multiplier: Int, result: [Int])] {
        return [
            (source: [1, 2, 3], multiplier: 2, result: [2, 4, 6]),
            (source: [3, 2, 1], multiplier: 2, result: [6, 4, 2]),
            (source: [10, 10, 10], multiplier: 4, result: [40, 40, 40]),
            (source: [1, 1, 1], multiplier: 4, result: [4, 4, 4]),
            (source: [1, 1, 1], multiplier: 1, result: [1, 1, 1])
        ]
    }
    
    func getRemoveData() -> [(source: [Int], remove: [Int], result: [Int])] {
        return [
            (source: [1, 2, 3], remove: [1, 2], result: [3]),
            (source: [3, 4, 5], remove: [6], result: [3, 4, 5]),
            (source: [3, 4, 5, 6], remove: [6], result: [3, 4, 5]),
            (source: [3, 4, 5, 6], remove: [3, 4, 5, 6], result: []),
        ]
    }
}
