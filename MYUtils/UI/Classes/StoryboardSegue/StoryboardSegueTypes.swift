//
//  StoryboardSegue.swift
//  MYUtils
//
//  Created by Damon Cricket on 23.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - MYStoryboardSegueType

#if os(iOS)
    public typealias MYStoryboardSegueType = UIStoryboardSegue
#elseif os(tvOS)
    public typealias MYStoryboardSegueType = UIStoryboardSegue
#elseif os(OSX)
    public typealias MYStoryboardSegueType = NSStoryboardSegue
#endif
