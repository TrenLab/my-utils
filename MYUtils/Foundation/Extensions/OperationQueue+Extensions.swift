//
//  OperationQueue.swift
//  InstaCollage
//
//  Created by Optimus Prime on 30.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Perform on main thread sync

public func PerformOnMainThreadSync(_ code: @escaping () -> Swift.Void) {
    if Thread.isMainThread {
        code()
    } else {
        OperationQueue.main.addOperation(code)
    }
}

// MARK: - Perform on main thread async

public func PerformOnMainThreadAsync(_ code: @escaping () -> Swift.Void) {
    OperationQueue.main.addOperation(code)
}

// MARK: - Perform on background thread sync

public func PerformOnBackgroundThreadSync(_ code: @escaping () -> Swift.Void) {
    DispatchQueue.global(qos: .background).sync(execute: code)
}

// MARK: - Perform on background thread async

public func PerformOnBackgroundThreadAsync(_ code: @escaping () -> Swift.Void) {
    DispatchQueue.global(qos: .background).async(execute: code)
}
