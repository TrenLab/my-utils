//
//  NotificationCenterExtensionsTest.swift
//  MYUtils
//
//  Created by Damon Cricket on 30.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest

class NotificationCenterExtensionsTest: XCTestCase {
    
    // MARK: - Add Observer
    
    func testAddObserver() {
        for mock in getNotificationData() {
            let token = NotificationCenter.default.addObserver(forName: mock.name) {notification -> Void in
                XCTAssertEqual(notification.name, mock.name)
                XCTAssertEqual(notification.object as! Data?, mock.object)
                if mock.userInfo != nil {
                    XCTAssertEqual(notification.userInfo as! [String: Int], mock.userInfo!)
                }
            }
            NotificationCenter.default.removeObserver(token)
        }
        
        for mock in getNotificationData() {
            NotificationCenter.default.post(name: mock.name, object: mock.object, userInfo: mock.userInfo)
        }
    }
    
    func testAddObserverWithObject() {
        for mock in getNotificationData() {
            let token = NotificationCenter.default.addObserver(forName: mock.name, object: mock.object) {notification -> Void in
                XCTAssertEqual(notification.name, mock.name)
                XCTAssertEqual(notification.object as! Data?, mock.object)
                if mock.userInfo != nil {
                    XCTAssertEqual(notification.userInfo as! [String: Int], mock.userInfo!)
                }
            }
            NotificationCenter.default.removeObserver(token)
        }
        
        for mock in getNotificationData() {
            NotificationCenter.default.post(name: mock.name, object: nil, userInfo: mock.userInfo)
        }
    }
    
    // MARK: - Data
    
    func getNotificationData() -> [(name: NSNotification.Name, object: Data?, userInfo: [String: Int]?)] {
        
        return [
            (name: NSNotification.Name("first"), object: Data(), userInfo: ["first:first": 1, "first:second": 1]),
            (name: NSNotification.Name("second"),object: nil, userInfo: ["second:first": 2, "second:second": 2]),
            (name: NSNotification.Name("third"), object: Data(), userInfo: ["third:first": 3, "third:second": 3]),
            (name: NSNotification.Name("fourth"), object: Data(), userInfo: nil)
        ]
    }
}
