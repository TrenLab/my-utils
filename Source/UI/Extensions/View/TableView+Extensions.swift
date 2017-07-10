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

// MARK: - MYTableViewType

#if os(iOS)
    /**
     Platform independet TableView type.
     */
    public typealias MYTableViewType  = UITableView
#elseif os(tvOS)
    /**
     Platform independet TableView type.
     */
    public typealias MYTableViewType  = UITableView
#elseif os(OSX)
    /**
     Platform independet TableView type.
     */
    public typealias MYTableViewType  = NSTableView
#endif

// MARK: - Layout

#if os(OSX)
@IBDesignable public extension MYTableViewType {
    /**
     A Boolean value indicating whether the table uses static data.
     */
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
