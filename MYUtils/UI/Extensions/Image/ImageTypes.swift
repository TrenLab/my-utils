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
    /**
     Platform independet Image type.
     */
    public typealias MYImage = UIImage
    
    /**
     Platform independet ImageView type.
     */
    public typealias MYImageView = UIImageView
#elseif os(watchOS)
    /**
     Platform independet Image type.
     */
    public typealias MYImage = UIImage
    
    /**
     Platform independet ImageView type.
     */
    public typealias MYImageView = WKInterfaceImage
#elseif os(tvOS)
    /**
     Platform independet Image type.
     */
    public typealias MYImage = UIImage
    
    /**
     Platform independet ImageView type.
     */
    public typealias MYImageView = UIImageView
#elseif os(OSX)
    /**
     Platform independet Image type.
     */
    public typealias MYImage = NSImage
    
    /**
     Platform independet ImageView type.
     */
    public typealias MYImageView = NSImageView
#endif

// MARK: - Image Download Completion

public typealias MYImageDownloadCompletion = ((_ image: MYImage?) -> Void)
