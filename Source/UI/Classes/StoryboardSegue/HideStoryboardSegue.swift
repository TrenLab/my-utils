//
//  HideStoryboardSegue.swift
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

// MARK: - HideStoryboardSegue

#if os(iOS) || os(tvOS) || os(OSX)
/**
 Removes the destination view controller from the source view controller.
 */
@objc(HideStoryboardSegue)
class HideStoryboardSegue: MYStoryboardSegueType {
    override open func perform() {
        #if os(iOS)
            destination.removeChild(viewController: source)
        #elseif os(tvOS)
            destination.removeChild(viewController: source)
        #elseif os(OSX)
            (destinationController as! NSViewController).removeChild(viewController: (sourceController as! NSViewController))
        #endif
    }
}
#endif
