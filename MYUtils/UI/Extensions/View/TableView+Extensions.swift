//
//  TableView+Extensions.swift
//  MYUtils
//
//  Created by Damon Cricket on 13.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

// MARK: - Typealias

#if os(iOS)
    public typealias MYTableViewType  = UITableView
#elseif os(tvOS)
    public typealias MYTableViewType  = UITableView
#elseif os(OSX)
    public typealias MYTableViewType  = NSTableView
#endif

// MARK: - Uses

#if os(OSX)
    @IBDesignable public extension MYTableViewType {
        @IBInspectable public var staticCells: Bool {
            set {
                usesStaticContents = true
            }
            get {
                return usesStaticContents
            }
        }
    }
#endif
