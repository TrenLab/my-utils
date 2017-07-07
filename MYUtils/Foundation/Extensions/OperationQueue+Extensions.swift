//
//  OperationQueue.swift
//  InstaCollage
//
//  Created by Optimus Prime on 30.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Perform on thread

/**
 Performs block synchronously on the main thread.
 - Parameters:
    - code: The block to execute from the operation object. The block should take no parameters and have no return value.
 */
public func PerformOnMainThreadSync(_ code: @escaping () -> Swift.Void) {
    if Thread.isMainThread {
        code()
    } else {
        OperationQueue.main.addOperation(code)
    }
}

/**
 Performs block asynchronously on the main thread.
 - Parameters:
    - code: The block to execute from the operation object. The block should take no parameters and have no return value.
 */
public func PerformOnMainThreadAsync(_ code: @escaping () -> Swift.Void) {
    OperationQueue.main.addOperation(code)
}

/**
 Performs block synchronously on the background thread.
 - Parameters:
    - code: The block to execute from the operation object. The block should take no parameters and have no return value.
 */
public func PerformOnBackgroundThreadSync(_ code: @escaping () -> Swift.Void) {
    DispatchQueue.global(qos: .background).sync(execute: code)
}

/**
 Performs block asynchronously on the background thread.
 - Parameters:
    - code: The block to execute from the operation object. The block should take no parameters and have no return value.
 */
public func PerformOnBackgroundThreadAsync(_ code: @escaping () -> Swift.Void) {
    DispatchQueue.global(qos: .background).async(execute: code)
}
