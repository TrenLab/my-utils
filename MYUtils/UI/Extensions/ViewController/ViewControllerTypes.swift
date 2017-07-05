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
    public typealias MYViewControllerType = UIViewController
#elseif os(tvOS)
    public typealias MYViewControllerType = UIViewController
#elseif os(macOS)
    public typealias MYViewControllerType = NSViewController
#endif
