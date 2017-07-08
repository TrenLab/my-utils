//
//  Dictionary+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 01.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Operators

/**
 Returns true if left and right dictionaries are equal. 
 Otherwise returns false.
 */
public func ==<Key: Equatable, Value: Equatable>(lhs: [Key: Value], rhs: [Key: Value]) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

/**
 Concatenates two dictionaries and assigns the result to left value.
 - Parameters:
    - lhs: Left dictionary.
    - rhs: Right dictionary.
 */
public func +=<K, V> (lhs: inout [K: V], rhs: [K: V]) {
    lhs = lhs + rhs
}

/**
 Returns the result of concatenate two array.
 - Parameters:
    - lhs: Left array.
    - rhs: Right array.
 */
public func +<K, V> (lhs: [K: V], rhs: [K: V]) -> [K: V] {
    var new = lhs
    for (key, value) in rhs {
        new[key] = value
    }
    return new
}

// MARK: - Enumerate

public extension Dictionary where Key: Any, Value: Any {
    
    /**
     Returns a dictionary containing the results of mapping the given closure over the dictionary key value pairs.
     - Parameters:
        - provider: A mapping closure. provider accepts a key and a value of this dictionary as its parameter and returns a returned value
                    of the same or of a different type.
     */
    public func make<T>(_ provider: (_ key: Key,_ value: Value) -> T?) -> [Key: T] {
        var dictionary = [Key: T]()
        enumerate {key, value in
            if let new = provider(key, value) {
                dictionary[key] = new
            }
        }
        return dictionary
    }
    
    /**
     Enumerates a dictionary.
     - Parameters:
        - closure: A enumerate closure, provides a key and a value.
     */
    public func enumerate(closure: (_ key: Key,_ value: Value) -> Void) {
        for (key, value) in self {
            closure(key, value)
        }
    }
}

// MARK: - Keys / Values

public extension Dictionary where Key: Any, Value: Any {
    
    /**
     Returns keys, contained in the receiver.
     */
    public var keys: [Key] {
        var ks = [Key]()
        
        enumerate {key,_ in
            ks.append(key)
        }
        
        return ks
    }
    
    /**
     Returns values, contained in the receiver.
     */
    public var values: [Value] {
        var vls = [Value]()
        
        enumerate {_, value in
            vls.append(value)
        }
        
        return vls
    }
}
