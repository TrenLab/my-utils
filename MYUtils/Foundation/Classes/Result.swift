//
//  Result.swift
//  Click fight
//
//  Created by Optimus Prime on 11.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Result

public enum Result<T, Error>: CustomStringConvertible, CustomDebugStringConvertible {
    
    case success(T)
    
    case failure(Error)
    
    // MARK: - Setup / Teardown
    
    public init(value: T) {
        self = .success(value)
    }
    
    public init(error: Error) {
        self = .failure(error)
    }

    // MARK: - Properties
    
    public var isSuccess: Bool {
        switch self {
        case .success(_):
            return true
        case .failure(_):
            return false
        }
    }
    
    public var isFailure: Bool {
        switch self {
        case .success(_):
            return false
        case .failure(_):
            return true
        }
    }
    
    // MARK: - Handle
    
    public func handle<Result>(success: (T) -> Result, failure: (Error) -> Result) -> Result {
        switch self {
        case .success(let value):
            return success(value)
        case .failure(let value):
            return failure(value)
        }
    }
    
    public func handleSuccess(completion: (T) -> Void) {
        switch self {
        case .success(let value):
            completion(value)
        case .failure(_):
            break
        }
    }
    
    public func handleFailure(completion: (Error) -> Void) {
        switch self {
        case .success(_):
            break
        case .failure(let value):
            completion(value)
        }
    }
    
    // MARK: - Description
    
    public var description: String {
        return handle(
            success: {
                ".success(\($0))"
            }, failure: {
                ".failure(\($0))"
            }
        )
    }
    
    public var debugDescription: String {
        return description
    }
}
