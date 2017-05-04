//
//  Array+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 21.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Operators

public func += <V>(left: inout [V], right: [V]) {
    left = left + right
}

public func + <V>(left: [V], right: [V]) -> [V] {
    return [left, right].flatMap {(element: [V]) -> [V] in
        return element
    }
}

// MARK: - Enumerate

public extension Array {

    public func make<T>(_ provider: (_ idx: UInt,_ object: Element) -> T?) -> [T] {
        var array = [T]()
        
        enumerate {idx, object in
            if let new = provider(idx, object) {
                array.append(new)
            }
        }
        
        return array
    }
    
    public func enumerate(closure: ( _ idx: UInt, _ object: Element) -> Void) {
        var idx: UInt = 0
        
        for value in self {
            closure(idx, value)
            idx += 1
        }
    }
}

// MARK: - Add / Remove

public extension Array where Element: Equatable {
    
    public mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}

