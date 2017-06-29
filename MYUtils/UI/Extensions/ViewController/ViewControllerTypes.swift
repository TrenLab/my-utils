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

// MARK: - Typealias

#if os(iOS)
    public typealias MYViewController = UIViewController
#elseif os(tvOS)
    public typealias MYViewController = UIViewController
#elseif os(macOS)
    public typealias MYViewController = NSViewController
#endif
