//
//  ShowStoryboardSegue.swift
//  Click fight
//
//  Created by Optimus Prime on 15.12.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - ShowStoryboardSegue

/**
 Adds the destination view controller as a child to the source view controller.
 */
@objc(ShowStoryboardSegue)
class ShowStoryboardSegue: MYStoryboardSegueType {
    override open func perform() {
        #if os(iOS)
            source.addChild(viewController: destination)
        #elseif os(tvOS)
            source.addChild(viewController: destination)
        #elseif os(OSX)
            (sourceController as! NSViewController).addChild(viewController: (destinationController as! NSViewController))
        #endif
    }
}
