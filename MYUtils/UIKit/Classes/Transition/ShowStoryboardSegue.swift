//
//  ShowStoryboardSegue.swift
//  Click fight
//
//  Created by Optimus Prime on 15.12.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - ShowStoryboardSegue

@objc(ShowStoryboardSegue)
class ShowStoryboardSegue: MY_STORY_BOARD_SEGUE {

    // MARK: - Pepform
    
    override func perform() {
        #if os(iOS)
            source.removeFromSuperViewController()
        #elseif os(OSX)
            (sourceController as! NSViewController).removeFromParentViewController()
        #endif
    }
}
