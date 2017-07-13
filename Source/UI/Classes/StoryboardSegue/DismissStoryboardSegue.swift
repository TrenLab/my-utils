//
//  DismissStoryboardSegue.swift
//  InstaCollage
//
//  Created by Optimus Prime on 14.02.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - DismissStoryboardSegue

#if os(iOS) || os(tvOS) || os(OSX)
/**
 Dismisses the source view controller that was presented modally by the destination view controller.
 */
@objc(DismissStoryboardSegue)
open class DismissStoryboardSegue: MYStoryboardSegueType {
    override open func perform() {
        #if os(iOS)
            source.dismiss(animated: true, completion: nil)
        #elseif os(tvOS)
            source.dismiss(animated: true, completion: nil)
        #elseif os(OSX)
            (destinationController as! NSViewController).dismissViewController(sourceController as! NSViewController)
        #endif
    }
}
#endif
