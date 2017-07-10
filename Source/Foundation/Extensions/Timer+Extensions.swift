//
//  Timer+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 02.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Closure Timer

public extension Timer {
    
    /**
     Creates and returns a new delay Timer object and schedules it on the current run loop in the default mode.
     - Parameters:
        - delay: The time at which the timer should fire.
        - handler: The block invoked when the timer fires. The block takes timer argument.
     */
    public class func schedule(delay: TimeInterval, handler: @escaping (Timer?) -> Void) -> Timer {
        let fireDate = delay + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)
        return timer!
    }
    
    /**
     Creates and returns a new NSTimer object and schedules it on the current run loop in the default mode.
     - Parameters:
        - interval: The time at which the timer should fire.
        - handler: The block invoked when the timer fires. The block takes timer argument.
     */
    public class func schedule(repeatInterval interval: TimeInterval, handler: @escaping (Timer?) -> Void) -> Timer {
        let fireDate = interval + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, interval, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)
        
        return timer!
    }
}
