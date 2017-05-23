//
//  StoryboardSegue.swift
//  MYUtils
//
//  Created by Damon Cricket on 23.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - Cross platform typealias

#if os(iOS)
    public typealias MY_STORY_BOARD_SEGUE = UIStoryboardSegue
#elseif os(OSX)
    public typealias MY_STORY_BOARD_SEGUE = NSStoryboardSegue
#endif
