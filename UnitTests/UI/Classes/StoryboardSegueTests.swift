//
//  StoryboardSegueTests.swift
//  MYUtils
//
//  Created by Damon Cricket on 01.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest

class StoryboardSegueTests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        #if os(iOS)
            if #available(iOS 9.0, *) {
                XCUIApplication().launch()
            }
        #elseif os(tvOS)
            XCUIApplication().launch()
        #endif
    }

    // MARK: - Dismiss
    
    func testDismiss() {
        #if os(iOS)
            if #available(iOS 9.0, *) {
                let app = XCUIApplication()
                let tablesQuery = app.tables
                tablesQuery.staticTexts["Storyboard Segue"].tap()
                tablesQuery.staticTexts["Dismiss"].tap()
                app.navigationBars["Dismiss"].buttons["Menu"].tap()
                
                XCTAssertTrue(app.staticTexts["Storyboard Segue"].exists)
                XCTAssertFalse(app.navigationBars["Dismiss"].exists)
            }
        #elseif os(tvOS)
        #elseif os(OSX)
        #endif
    }
    
    // MARK: - Show / Hide

    func testShow() {
        #if os(iOS)
            if #available(iOS 9.0, *) {
                let app = XCUIApplication()
                let tablesQuery = app.tables
                tablesQuery.staticTexts["Storyboard Segue"].tap()
                tablesQuery.staticTexts["Show / Hide"].tap()
                
                XCTAssertTrue(app.buttons["Add Child"].exists)
                XCTAssertFalse(app.buttons["Remove Child"].exists)
                app.buttons["Add Child"].tap()
                XCTAssertTrue(app.buttons["Add Child"].exists)
                XCTAssertTrue(app.buttons["Remove Child"].exists)
                
                app.buttons["Remove Child"].tap()
                XCTAssertTrue(app.buttons["Add Child"].exists)
                XCTAssertFalse(app.buttons["Remove Child"].exists)
            }
        #elseif os(tvOS)
        #elseif os(OSX)
        #endif
    }
    
    // MARK: - Pop
    
    func testPop() {
        #if os(iOS)
            if #available(iOS 9.0, *) {
                let app = XCUIApplication()
                let tablesQuery = app.tables
                tablesQuery.staticTexts["Storyboard Segue"].tap()
                tablesQuery.staticTexts["Pop"].tap()
            
                XCTAssertTrue(app.navigationBars["Pop"].exists)
                XCTAssertFalse(app.staticTexts["Storyboard Segue"].exists)
            
                app.navigationBars["Pop"].buttons["Menu"].tap()
            
                XCTAssertTrue(app.staticTexts["Storyboard Segue"].exists)
                XCTAssertFalse(app.navigationBars["Pop"].exists)
            }
        #elseif os(tvOS)
        #endif
    }
}
