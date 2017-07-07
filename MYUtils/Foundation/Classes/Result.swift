//
//  Result.swift
//  Click fight
//
//  Created by Optimus Prime on 11.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Result

/**
 Used to represent whether a request was successful or encountered an error.
 - success: The request and all post processing operations were successful resulting in the serialization of the
            provided associated value.
 
 - failure: The request encountered an error resulting in a failure. The associated values are the original data
            provided by the server as well as the error that caused the failure.
 */

public enum Result<T, Error> {
    
    case success(T)
    
    case failure(Error)
    
    // MARK: - Is
    
    /**
     Returns `true` if the result is a success, `false` otherwise.
    */
    public var isSuccess: Bool {
        switch self {
        case .success(_):
            return true
        case .failure(_):
            return false
        }
    }
    
    /**
     Returns `true` if the result is a failure, `false` otherwise.
     */
    public var isFailure: Bool {
        switch self {
        case .success(_):
            return false
        case .failure(_):
            return true
        }
    }
    
    // MARK: - Handle
    
    /**
     Handle Result instance.
     - Parameters:
        - success: `Closure`, that called if instance contains a `success` and delivers associated `value` value as parameter.
        - failure: `Closure`, that called if instance contains a `failure`  and delivers associated `error` value as parameter.
     */
    public func handle<Result>(success: (T) -> Result, failure: (Error) -> Result) -> Result {
        switch self {
        case .success(let value):
            return success(value)
        case .failure(let value):
            return failure(value)
        }
    }
    
    /**
     Handle success Result instance.
     - Parameters:
        - closure: `Closure`, that called if instance contains a `success` and delivers associated `value` value as parameter.
     */
    public func handleSuccess(closure: (T) -> Void) {
        switch self {
        case .success(let value):
            closure(value)
        case .failure(_):
            break
        }
    }
    
    /**
     Handle failure Result instance.
     - Parameters:
        - closure: `Closure`, that called if instance contains a `failure` and delivers associated `error` value as parameter.
     */
    public func handleFailure(closure: (Error) -> Void) {
        switch self {
        case .success(_):
            break
        case .failure(let value):
            closure(value)
        }
    }
}

// MARK: - CustomStringConvertible, CustomDebugStringConvertible

extension Result: CustomStringConvertible, CustomDebugStringConvertible {
    
    /**
     The textual representation used when written to an output stream, which includes whether the result was a
     success or failure.
     */
    public var description: String {
        return handle(
            success: {
                ".success(\($0))"
        }, failure: {
            ".failure(\($0))"
        }
        )
    }
    
    /**
     The debug textual representation used when written to an output stream, which includes whether the result was a
     success or failure in addition to the value or error.
     */
    public var debugDescription: String {
        return description
    }
}
