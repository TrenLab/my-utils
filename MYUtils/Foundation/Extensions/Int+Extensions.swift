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
    public static func random(min: Int, max: Int) -> Int {
        return Int.random(n: max - min + 1) + min
    }

    public static func random(n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }

    public static var randomSign: Int {
        return (arc4random_uniform(2) == 0) ? 1 : -1
    }
}
