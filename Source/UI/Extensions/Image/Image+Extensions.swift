//
//  UIImage+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
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

import CoreGraphics

// MARK: - MYImageOrientation

/**
 Represents image orientation.
 */
public enum MYImageOrientation: Int {
    
    case portret = 0
    
    case album
    
    case square
}

// MARK: - Orientation

public extension MYImage {
    /**
     Returns `true` if an image has a portret orientation. Otherwise returns `false`.
     */
    public var isPortret: Bool {
        return orientation == .portret
    }
    
    /**
     Returns `true` if an image has an album orientation. Otherwise returns `false`.
     */
    public var isAlbum: Bool {
        return orientation == .album
    }
    
    /**
     Returns `true` if an image has a sguare orientation. Otherwise returns `false`.
     */
    public var isSquare: Bool {
        return orientation == .square
    }
    
    /**
     Returns current image orientation.
     */
    public var orientation: MYImageOrientation {
        if size.width < size.height {
            return .portret
        } else if size.width > size.height {
            return .album
        } else {
            return .square
        }
    }
}

// MARK: - Load

public extension MYImage {

    /**
     Downloads an image from specified url.
     - Parameters:
        - url: Image resource url.
        - completion: The completion closure to be executed when operation has been completed.
     */
    public static func from(URL url: URL, completion: MYImageDownloadCompletion? = nil) {
        if let cachedImageData = cache[url.absoluteString] {
            completion?(MYImage(data: cachedImageData as! Data))
            return
        }
        
        DispatchQueue.global().async {
            var img: MYImage? = nil
            
            if let imgData = try? Data(contentsOf: url) {
                img = MYImage(data: imgData)
                cache[url.absoluteString] = imgData as AnyObject?
            }
            
            DispatchQueue.main.async {
                completion?(img)
            }
        }
    }
}

// MARK: - Cache

public extension MYImage {
    /**
     Image cache.
     */
    class var cache: Cache {
        set {
            ImageCache = newValue
        } get {
            return ImageCache
        }
    }
}

fileprivate var ImageCache = Cache.create(withName: "image")

// MARK: - Draw

/**
 Draws an image with specified size and adjusted in `draw` closure.
 - Parameters:
    - size: A size of image.
    - draw: A draw closure, accepts the current graphic context.
 */
public func MYImageDraw(size: CGSize, draw: ((CGContext) -> Void)? = nil) -> MYImage {
    #if os(iOS) || os(watchOS) || os(tvOS)
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
    
        draw?(UIGraphicsGetCurrentContext()!)
        let image: MYImage = UIGraphicsGetImageFromCurrentImageContext()!
    
        UIGraphicsEndImageContext()
        return image
    #elseif os(macOS)
        let image = MYImage.init(size: size)
        
        let rep = NSBitmapImageRep(bitmapDataPlanes: nil,
                                        pixelsWide: Int(size.width),
                                        pixelsHigh: Int(size.height),
                                        bitsPerSample: 8,
                                        samplesPerPixel: 4,
                                        hasAlpha: true,
                                        isPlanar: false,
                                        colorSpaceName: NSCalibratedRGBColorSpace,
                                        bytesPerRow: 0,
                                        bitsPerPixel: 0)
        
        image.addRepresentation(rep!)
        image.lockFocus()
        let ctx = NSGraphicsContext.current()?.cgContext
        draw?(ctx!)
        image.unlockFocus()
        return image
    #endif
}
