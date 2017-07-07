//
//  StringExtensionsTest.swift
//  MYUtils
//
//  Created by Damon Cricket on 30.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest

class StringExtensionsTest: XCTestCase {
    
    // MARK: - Convert
    
    func testConvert() {
        for mock in getConvertData() {
            XCTAssertEqual(mock.data.int, mock.int)
            XCTAssertEqual(mock.data.uint, mock.uint)
            XCTAssertEqual(mock.data.ns_string, mock.nsstring)
        }
    }
    
    // MARK: - Random 
    
    func testRandom() {
        for mock in getRandomStringData() {
            let gen = String.random(wihtLength: mock.length, fromLetters: mock.alphabet)
            XCTAssertEqual(gen.length, mock.length)
            
            for character in mock.alphabet.characters {
                XCTAssertTrue(mock.alphabet.characters.contains(character))
            }
        }
    }
    
    // MARK: - Length
    
    func testLength() {
        for mock in getLengthData() {
            XCTAssertEqual(mock.data.length, mock.length)
        }
    }
    
    // MARK: - Encode
    
    func testEncode() {
        for mock in getEncodeData() {
            XCTAssertEqual(mock.data.URLEncodedString, mock.encoded)
        }
    }
    
    // MARK: - Decode
    
    func testDecode() {
        for mock in getDecodeData() {
            XCTAssertEqual(mock.data.URLDecodedString, mock.encoded)
        }
    }
    
    // MARK: - Data
    
    func getConvertData() -> [(data: String, int: Int?, uint: UInt?, nsstring: NSString)] {
        return [
            (data: "1234", int: 1234, uint: 1234, nsstring: NSString(string: "1234")),
            (data: "asd3", int: nil, uint: nil, nsstring: NSString(string: "asd3")),
            (data: "-1123", int: -1123, uint: nil, nsstring: NSString(string: "-1123")),
            (data: "aaqqa", int: nil, uint: nil, nsstring: NSString(string: "aaqqa")),
            (data: "", int: nil, uint: nil, nsstring: NSString(string: ""))
        ]
    }
    
    func getRandomStringData() -> [(length: Int, alphabet: String)] {
        return [
            (length: 10, alphabet: String.standardAlphabet),
            (length: 9, alphabet: "0123456789"),
            (length: 5, alphabet: "dfrtblghtynxa"),
            (length: 12, alphabet: "lof'';gty;p")
        ]
    }
    
    func getLengthData() -> [(data: String, length: Int)] {
        return [
            (data: "1234", length: 4),
            (data: "11", length: 2),
            (data: "0123456789", length: 10),
            (data: "012345678", length: 9)
        ]
    }
    
    func getEncodeData() -> [(data: String, encoded: String)] {
        return [
            (data: "Lorem ipsum dolor sit amet, ", encoded: "Lorem%20ipsum%20dolor%20sit%20amet,%20"),
            (data: " consectetur adipiscing - elit ()", encoded: "%20consectetur%20adipiscing%20-%20elit%20()"),
            (data: "sed do eiusmod tempor incididunt", encoded: "sed%20do%20eiusmod%20tempor%20incididunt"),
            (data: "http://lipsum.com/", encoded: "http://lipsum.com/")
        ]
    }
    
    func getDecodeData() -> [(data: String, encoded: String)] {
        return [
            (data: "Lorem%20ipsum%20dolor%20sit%20amet,%20", encoded: "Lorem ipsum dolor sit amet, "),
            (data: "%20consectetur%20adipiscing%20-%20elit%20()", encoded:  " consectetur adipiscing - elit ()"),
            (data: "sed%20do%20eiusmod%20tempor%20incididunt" , encoded: "sed do eiusmod tempor incididunt"),
            (data: "http://lipsum.com/", encoded: "http://lipsum.com/")
        ]
    }
}
