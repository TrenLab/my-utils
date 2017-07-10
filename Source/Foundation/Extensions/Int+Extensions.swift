//
//  Int+Extensions.swift
//  MYUtils
//
//  Created by Damon Cricket on 02.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

// MARK: - Random

public extension Int {
    
    /**
     Returns a random number in a range between min and max.
     - Parameters:
        - min: Minimum value.
        - max: Maximum value.
     */
    public static func random(min: Int, max: Int) -> Int {
        return Int.random(n: max - min + 1) + min
    }
    
    /**
     Returns a random number with upper bound.
     - Parameters:
        - n: A upper bound.
     */
    public static func random(n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }

    /**
     Returns a random sign. +1 or -1.
     */
    public static var randomSign: Int {
        return (arc4random_uniform(2) == 0) ? 1 : -1
    }
}
