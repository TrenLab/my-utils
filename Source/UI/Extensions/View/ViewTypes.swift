//
//  ViewTypes.swift
//  MYUtils
//
//  Created by Damon Cricket on 24.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

// MARK: - MYViewType

#if os(iOS)
    /**
     Platform independet View type.
     */
    public typealias MYViewType  = UIView
#elseif os(tvOS)
    /**
     Platform independet View type.
     */
    public typealias MYViewType  = UIView
#elseif os(OSX)
    /**
     Platform independet View type.
     */
    public typealias MYViewType  = NSView
#endif
