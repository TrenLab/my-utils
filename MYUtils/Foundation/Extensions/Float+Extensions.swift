//
//  Float+Extensions.swift
//  MYUtils
//
//  Created by Damon Cricket on 02.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

// MARK: - Random

public extension Float {
    public static func random(min: Float, max: Float) -> Float {
        return random * (max - min) + min
    }

    public static var random: Float {
        return Float(arc4random()) / 0xFFFFFFFF
    }

    public static var randomSign: Float {
        return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
    }
}
