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
    
    /**
     Returns the random `CGFloat` number in a range between min and max values.
     - Parameters:
        - min: The minimum value.
        - max: The maximum value.
     */
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random * (max - min) + min
    }

    /**
     Returns the random `CGFloat` number in a range between 0.0 and 1.0.
     */
    public static var random: CGFloat {
        return CGFloat(Float.random)
    }

    /**
     Returns the random sign
     */
    public static var randomSign: CGFloat {
        return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
    }
}
