//
//  PopStoryboardSegue.swift
//  MYUtils
//
//  Created by Damon Cricket on 01.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#endif

// MARK: - PopStoryboardSegue

/**
 Pops the top view controller from the navigation stack and updates the display.
 */
@objc(PopStoryboardSegue)
class PopStoryboardSegue: MYStoryboardSegueType {
    override open func perform() {
        #if os(iOS)
            source.navigationController?.popViewController(animated: true)
        #elseif os(tvOS)
            if let navigationController = source.navigationController {
                navigationController.popViewController(animated: true)
            } else {
                source.dismiss(animated: true)
            }
        #endif
    }
}
