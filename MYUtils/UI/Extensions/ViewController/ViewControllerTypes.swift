//
//  ViewControllerTypes.swift
//  MYUtils
//
//  Created by Damon Cricket on 24.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#elseif os(macOS)
    import Cocoa
#endif

// MARK: - MYViewControllerType

#if os(iOS)
    /**
     Platform independet ViewController type.
     */
    public typealias MYViewControllerType = UIViewController
#elseif os(tvOS)
    /**
     Platform independet ViewController type.
     */
    public typealias MYViewControllerType = UIViewController
#elseif os(macOS)
    /**
     Platform independet ViewController type.
     */
    public typealias MYViewControllerType = NSViewController
#endif
