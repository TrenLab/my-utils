//
//  UserDefaultsExtensionsTest.swift
//  MYUtils
//
//  Created by Damon Cricket on 31.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest

class UserDefaultsExtensionsTest: XCTestCase {
    
    // MARK: - NSCoding
    
    func testNSCoding() {
        for mock in getNSCodingData() {
            UserDefaults.standard.set(mock.object, forKey: mock.key)
        }
        
        for mock in getNSCodingData() {
            let object: Mock? = UserDefaults.standard.object(forKey: mock.key)
            XCTAssertNotNil(object)
            XCTAssertEqual(object, mock.object)
        }
    }
    
    // MARK: - Subscript
    
    func testSubscript() {
        for mock in getSubscriptData() {
            UserDefaults.standard[mock.key] = mock.value
        }
        
        for mock in getSubscriptData() {
            let value = UserDefaults.standard[mock.key] as! String
            XCTAssertEqual(value, mock.value)
        }
    }
    
    // MARK: - Data
    
    func getNSCodingData() -> [(object: Mock, key: String)] {
        return [
            (object: Mock(text: "Lorem ipsum dolor sit amet"), key: "Lorem"),
            (object: Mock(text: "consectetur adipiscing elit"), key: "ipsum"),
            (object: Mock(text: "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"), key: "dolor"),
            (object: Mock(text: "Ut enim ad minim veniam"), key: "sit"),
            (object: Mock(text: "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"), key: "amet")
        ]
    }
    
    func getSubscriptData() -> [(key: String, value: String)] {
        return [
            (key: "Lorem", value: "Lorem ipsum dolor sit amet"),
            (key: "ipsum", value: "consectetur adipiscing elit"),
            (key: "dolor", value: "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"),
            (key: "sit",   value: "Ut enim ad minim veniam"),
            (key: "amet",  value: "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat")
        ]
    }
}

// MARK: - Mock

class Mock: NSObject, NSCoding {
    
    var text: String = ""

    convenience required init?(coder aDecoder: NSCoder) {
        let text = aDecoder.decodeObject(forKey: "text") as! String
        self.init(text: text)
    }
    
    init(text: String) {
        super.init()
        self.text = text
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "text")
    }

    override func isEqual(_ object: Any?) -> Bool {
        return object != nil && object is Mock && text == (object as! Mock).text
    }
}
