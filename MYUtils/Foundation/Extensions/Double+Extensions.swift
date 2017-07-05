//
//  Double+Extensions.swift
//  MYUtils
//
//  Created by Damon Cricket on 02.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

// MARK: - Random 

public extension Double {
    public static func random(min: Double, max: Double) -> Double {
        return random * (max - min) + min
    }

    public static var random: Double {
        return Double(arc4random()) / 0xFFFFFFFF
    }

    public static var randomSign: Double {
        return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
    }
}
