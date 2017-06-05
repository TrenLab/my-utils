//
//  CGFloat+Extensions.swift
//  MYUtils
//
//  Created by Damon Cricket on 02.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import CoreGraphics

// MARK: - Random

public extension CGFloat {
    
    // MARK: - min ... max
    
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random * (max - min) + min
    }
    
    // MARK: - ... random
    
    public static var random: CGFloat {
        return CGFloat(Float.random)
    }
    
    // MARK: - -1.0 OR 1.0
    
    public static var randomSign: CGFloat {
        return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
    }
}
