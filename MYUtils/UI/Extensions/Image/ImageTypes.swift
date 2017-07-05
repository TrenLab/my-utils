//
//  Types.swift
//  MYUtils
//
//  Created by Damon Cricket on 23.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(watchOS)
    import UIKit
    import WatchKit
#elseif os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - MYImage / MYImageView

#if os(iOS)
    public typealias MYImage = UIImage
    public typealias MYImageView = UIImageView
#elseif os(watchOS)
    public typealias MYImage = UIImage
    public typealias MYImageView = WKInterfaceImage
#elseif os(tvOS)
    public typealias MYImage = UIImage
    public typealias MYImageView = UIImageView
#elseif os(OSX)
    public typealias MYImage = NSImage
    public typealias MYImageView = NSImageView
#endif

// MARK: - Image Download Completion

public typealias MYImageDownloadCompletion = ((_ image: MYImage?) -> Void)
