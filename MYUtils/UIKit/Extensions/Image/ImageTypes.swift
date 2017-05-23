//
//  Types.swift
//  MYUtils
//
//  Created by Damon Cricket on 23.05.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - Image typealias

#if os(iOS)
    public typealias MY_IMAGE = UIImage
#elseif os(OSX)
    public typealias MY_IMAGE = NSImage
#endif

// MARK: - Image Download Completion

public typealias MYImageDownloadCompletion = ((_ image: UIImage?) -> Void)
