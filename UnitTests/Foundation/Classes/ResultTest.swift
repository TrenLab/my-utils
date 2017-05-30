//
//  ResultTest.swift
//  MYUtils
//
//  Created by Damon Cricket on 25.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest
@testable import MYUtils

// MARK: - TestError

enum MYResultTestError: Error, Equatable {
    
    case error(String)
    
    var error: String {
        switch self {
        case .error(let value):
            return value
        }
    }
    static func ==(lhs: MYResultTestError, rhs: MYResultTestError) -> Bool {
        return lhs.error == rhs.error
    }
}

// MARK: - ResultTest

class ResultTest: XCTestCase {
    
    // MARK: - Instance
    
    func testInstance() {
        for (idx, result) in successResults().enumerated() {
            let mock = successData()[idx]
            XCTAssertEqual(result.isSuccess, mock.isSuccess)
            XCTAssertEqual(result.isFailure, mock.isFailure)
        }
        
        for (idx, result) in failureResult().enumerated() {
            let mock = failureData()[idx]
            XCTAssertEqual(result.isSuccess, mock.isSuccess)
            XCTAssertEqual(result.isFailure, mock.isFailure)
        }
    }
    
    // MARK: - Handle
    
    func testHandle() {
        for (idx, result) in successResults().enumerated() {
            let mock = successData()[idx]
            result.handle(success: {value -> Void in
                XCTAssertEqual(value, mock.data)
            }, failure: {error -> Void in
                XCTAssertTrue(false)
            })
            result.handleSuccess {value -> Void in
                XCTAssertEqual(value, mock.data)
            }
            result.handleFailure {_ in
                XCTAssertTrue(false)
            }
        }
        
        for (idx, result) in failureResult().enumerated() {
            let mock = failureData()[idx]
            result.handle(success: {value -> Void in
                XCTAssertTrue(false)
            }, failure: {error -> Void in
                XCTAssertEqual(error, mock.data)
            })
            result.handleFailure {error -> Void in
                XCTAssertEqual(error, mock.data)
            }
            result.handleSuccess {_ in
                XCTAssertTrue(false)
            }
        }
    }
    
    // MARK: - Description
    
    func testDescription() {
        for (idx, result) in successResults().enumerated() {
            let mock = successData()[idx]
            XCTAssertEqual(result.description, mock.description)
            XCTAssertEqual(result.debugDescription, mock.debugDescription)
        }
        
        for (idx, result) in failureResult().enumerated() {
            let mock = failureData()[idx]
            XCTAssertEqual(result.description, mock.description)
            XCTAssertEqual(result.debugDescription, mock.debugDescription)
        }
    }
    
    // MARK: - Data
    
    
    func successResults() -> [Result<String, Error>] {
        return successData().map() {mock -> Result<String, Error> in
            return Result(value: mock.data)
        }
    }
    
    func failureResult() -> [Result<String, MYResultTestError>] {
        return failureData().map() {mock -> Result<String, MYResultTestError> in
            return Result(error: mock.data)
        }
    }
    
    func successData() -> [(data: String, isSuccess: Bool, isFailure: Bool, description: String, debugDescription: String)] {
        return [
            makeSuccessData(data: "Lorem ipsum dolor sit amet"),
            makeSuccessData(data: "Lorem ipsum dolor sit"),
            makeSuccessData(data: "Lorem ipsum dolor"),
            makeSuccessData(data: "Lorem ipsum"),
            makeSuccessData(data: "Lorem")
        ]
    }

    func failureData() -> [(data: MYResultTestError,  isSuccess: Bool, isFailure: Bool, description: String, debugDescription: String)] {
        return [
            makeFailureData(error: MYResultTestError.error("Lorem")),
            makeFailureData(error: MYResultTestError.error("Lorem ipsum")),
            makeFailureData(error: MYResultTestError.error("Lorem ipsum dolor")),
            makeFailureData(error: MYResultTestError.error("Lorem ipsum dolor sit")),
            makeFailureData(error: MYResultTestError.error("Lorem ipsum dolor sit amet"))
        ]
    }
    
    func makeSuccessData(data: String) -> (data: String, isSuccess: Bool, isFailure: Bool, description: String, debugDescription: String) {
        return (data, true, false, ".success(\(data))", ".success(\(data))")
    }
    
    func makeFailureData(error: MYResultTestError) -> (data: MYResultTestError,  isSuccess: Bool, isFailure: Bool, description: String, debugDescription: String) {
        return (error, false, true, ".failure(\(error))", ".failure(\(error))")
    }
}
