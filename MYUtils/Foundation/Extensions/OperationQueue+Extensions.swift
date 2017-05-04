//
//  OperationQueue.swift
//  InstaCollage
//
//  Created by Optimus Prime on 30.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

public func PerformOnMainThreadSync(_ code: @escaping () -> Swift.Void) {
    if Thread.isMainThread {
        code()
    } else {
        OperationQueue.main.addOperation(code)
    }
}

public func PerformOnMainThreadAsync(_ code: @escaping () -> Swift.Void) {
    OperationQueue.main.addOperation(code)
}

public func PerformOnBackgroundThreadAsync(_ code: @escaping () -> Swift.Void) {
    DispatchQueue.global(qos: DispatchQoS.default.qosClass).async(execute: code)
}

public func PerformOnBackgroundThreadSync(_ code: @escaping () -> Swift.Void) {
    DispatchQueue.global(qos: DispatchQoS.default.qosClass).sync(execute: code)
}
