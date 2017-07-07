//
//  UINavigationViewController+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 26.02.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#endif

// MARK: - Root ViewController

public extension UINavigationController {
    /**
     Returns the root view controller if it is exists. Otherwise returns `nil`.
     */
    public var rootViewController: UIViewController? {
        return viewControllers.first
    }
}
