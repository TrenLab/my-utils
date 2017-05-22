//
//  Dictionary+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 01.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Operators

public func ==<Key: Any, Value: Any>(lhs: [Key: Value], rhs: [Key: Value]) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

public func += <K, V> (left: inout [K: V], right: [K: V]) {
    left = left + right
}

public func + <K, V> (left: [K: V], right: [K: V]) -> [K: V] {
    var new = left
    for (key, value) in right {
        new[key] = value
    }
    
    return new
}

// MARK: - Enumerate

public extension Dictionary where Key: Any, Value: Any {
    
    public func make<T>(_ provider: (_ key: Key,_ value: Value) -> T?) -> [Key: T] {
        var dictionary = [Key: T]()
        
        enumerate {key, value in
            if let new = provider(key, value) {
                dictionary[key] = new
            }
        }
        
        return dictionary
    }
    
    public func enumerate(closure: (_ key: Key,_ value: Value) -> Void) {
        for (key, value) in self {
            closure(key, value)
        }
    }
}

// MARK: - Keys / Values

public extension Dictionary where Key: Any, Value: Any {
    public var keys: [Key] {
        var ks = [Key]()
        
        enumerate {key,_ in
            ks.append(key)
        }
        
        return ks
    }
    
    public var values: [Value] {
        var vls = [Value]()
        
        enumerate {_, value in
            vls.append(value)
        }
        
        return vls
    }
}
