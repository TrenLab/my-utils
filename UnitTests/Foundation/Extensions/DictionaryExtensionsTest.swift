//
//  DictionaryExtensionsTest.swift
//  MYUtils
//
//  Created by Damon Cricket on 30.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest
@testable import MYUtils

class DictionaryExtensionsTest: XCTestCase {
    
    // MARK: - Operators
    
    func testEquality() {
        for mock in getEqualityData() {
            XCTAssertEqual(mock.lhs == mock.rhs, mock.isEqual)
        }
    }
    
    func testSum() {
        for mock in getSumData() {
            let result = mock.first + mock.second

            XCTAssertEqual(result, mock.result)
        }
        
        for mock in getSumData() {
            var result = mock.first
            result += mock.second
            
            XCTAssertEqual(result, mock.result)
        }
    }
    
    // MARK: - Enumerate
    
    func testEnum() {
        var dictionary: [String: Int] = [:]
        getEnumData().enumerate {key, value in
            dictionary[key] = value
            XCTAssertEqual(value, getEnumData()[key])
        }

        XCTAssertEqual(dictionary, getEnumData())
    }
    
    func testMake() {
        for (source, multiplier, result) in getMakeData() {
            let rez = source.make {_, value in
                return value * multiplier
            }
            XCTAssertEqual(rez, result)
        }
    }
    
    // MARK: - Data
    
    func getEqualityData() -> [(lhs: [String: String], rhs: [String: String], isEqual: Bool)] {
        return [
            (lhs: ["1": "1", "2": "2"], rhs: ["1": "1", "2": "2"], isEqual: true),
            (lhs: ["1": "1", "2": "2"], rhs: ["1": "1"], isEqual: false),
            (lhs: ["2": "2"], rhs: ["1": "1", "2": "2"], isEqual: false),
            (lhs: ["1": "2", "2": "3"], rhs: ["1": "3", "2": "1"], isEqual: false),
            (lhs: [:], rhs: ["1": "1", "2": "2"], isEqual: false),
            (lhs: ["1": "1", "2": "2"], rhs: [:], isEqual: false)
        ]
    }
    
    func getSumData() -> [(first: [String: Int], second: [String: Int], result: [String: Int])] {
        return [
            (first: ["first": -3,"second": -2], second: ["third": -1, "fourth": 0], result: ["first": -3, "second": -2, "third": -1, "fourth": 0]),
            (first: ["first": 1, "second": 2], second: ["third": 3, "fourth": 4], result: ["first": 1, "second": 2, "third": 3, "fourth": 4]),
            (first: ["first": 1, "second": 2], second: ["third": 3, "fourth": 4], result: ["first": 1, "second": 2, "third": 3, "fourth": 4]),
            (first: ["first": 5, "second": 6], second: ["third": 7, "fourth": 8], result: ["first": 5, "second": 6, "third": 7, "fourth": 8])
        ]
    }
    
    func getEnumData() -> [String: Int] {
        return [
            "0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9
        ]
    }
    
    func getMakeData() -> [(source: [String: Int], multiplier: Int, result: [String: Int])] {
        return [
            (source: ["1": 1, "2": 2, "3": 3], multiplier: 2, result: ["1": 2, "2": 4, "3": 6]),
            (source: ["1": 3, "2": 2, "3": 1], multiplier: 2, result: ["1": 6, "2": 4, "3": 2]),
            (source: ["1": 10, "2": 10, "3": 10], multiplier: 4, result: ["1": 40, "2": 40, "3": 40]),
            (source: ["1": 1, "2": 1, "3": 1], multiplier: 4, result: ["1": 4, "2": 4, "3": 4]),
            (source: ["1": 1, "2": 1, "3": 1], multiplier: 1, result: ["1": 1, "2": 1, "3": 1])
        ]
    }
}
