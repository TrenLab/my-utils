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

@objc(HideStoryboardSegue)
class HideStoryboardSegue: MYStoryboardSegue {
    
    // MARK: - Pepform
    
    override open func perform() {
        #if os(iOS)
            destination.removeFromSuperViewController()
        #elseif os(tvOS)
            destination.removeFromSuperViewController()
        #elseif os(OSX)
            (destinationController as! NSViewController).removeFromParentViewController()
        #endif
    }
}
