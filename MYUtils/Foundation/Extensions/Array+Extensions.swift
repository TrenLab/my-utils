//
//  Array+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 21.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Operators

/**
 Concatenates two array and assigns the result to left value.
 - Parameters:
    - lhs: Left array.
    - rhs: Right array.
*/
public func += <V>(lhs: inout [V], rhs: [V]) {
    lhs = lhs + rhs
}

/**
 Returns the result of concatenate two array.
 - Parameters:
    - lhs: Left array.
    - rhs: Right array.
 */
public func + <V>(left: [V], right: [V]) -> [V] {
    return [left, right].flatMap {(element: [V]) -> [V] in
        return element
    }
}

// MARK: - Enumerate

public extension Array {
    
    /**
     Returns an array containing the results of mapping the given closure over the sequence’s elements.
     - Parameters:
        - provider: A mapping closure. provider accepts an index and an element of this sequence as its parameter and returns a returned value
                    of the same or of a different type.
     */
    public func make<T>(_ provider: (_ idx: Int,_ element: Element) -> T?) -> [T] {
        var array = [T]()
        enumerate {idx, object in
            if let new = provider(idx, object) {
                array.append(new)
            }
        }
        
        return array
    }
    
    /**
     Enumerates an array.
     - Parameters:
        - closure: A enumerate closure, provides an index and an element.
     */
    public func enumerate(closure: ( _ idx: Int, _ element: Element) -> Void) {
        var idx: Int = 0
        
        for value in self {
            closure(idx, value)
            idx += 1
        }
    }
}

// MARK: - Add / Remove

public extension Array where Element: Equatable {
    
    /**
     Removes the specified element.
     - Parameters:
        - element: The element to be removed.
     */
    public mutating func remove(element: Element) {
        if let index = index(of: element) {
            remove(at: index)
        }
    }
}
