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

@objc(DismissStoryboardSegue)
open class DismissStoryboardSegue: MYStoryboardSegue {
    
    // MARK: - Pepform
    
    override open func perform() {
        #if os(iOS)
            source.dismiss(animated: true, completion: nil)
        #elseif os(tvOS)
            source.dismiss(animated: true, completion: nil)
        #elseif os(OSX)
            (sourceController as! NSViewController).dismissViewController((destinationController as! NSViewController))
        #endif
    }
}
