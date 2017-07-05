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

public enum MYImageOrientation {
    
    case portret
    
    case album
    
    case square
}

// MARK: - Image Orientation

public extension MYImage {
    public var isPortret: Bool {
        return orientation == .portret
    }
    
    public var isAlbum: Bool {
        return orientation == .album
    }
    
    public var isSquare: Bool {
        return orientation == .square
    }
    
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

// MARK: - Image Load

public extension MYImage {
    public static func from(URLString string: String, completion: MYImageDownloadCompletion? = nil) {
        from(URL: URL(string: string)!, completion: completion)
    }
    
    public static func from(URL url: URL, completion: MYImageDownloadCompletion? = nil) {
        if let cachedImageData = ImageCache()[url.absoluteString] {
            completion?(MYImage(data: cachedImageData as! Data))
            return
        }
        
        DispatchQueue.global().async {
            var img: MYImage? = nil
            
            if let imgData = try? Data(contentsOf: url) {
                img = MYImage(data: imgData)
                ImageCache()[url.absoluteString] = imgData as AnyObject?
            }
            
            DispatchQueue.main.async {
                completion?(img)
            }
        }
    }
}

// MARK: - WKImage Orientation

#if os(watchOS)
public extension WKImage {
    var orientation: MYImageOrientation? {
        return image?.orientation
    }
}
#endif

// MARK: - WKImage Load

#if os(watchOS)
public extension WKImage {
    public static func from(URLString string: String, completion: MYImageDownloadCompletion? = nil) {
        from(URL: URL(string: string)!, completion: completion)
    }
    
    public static func from(URL url: URL, completion: MYImageDownloadCompletion? = nil) {
        MYImage.from(URL: url, completion: completion)
    }
}
#endif

// MARK: - Draw

public func MYImageDraw(size: CGSize, draw: ((_ size: CGSize, _ context: CGContext)-> ())?) -> MYImage {
    #if os(iOS) || os(watchOS) || os(tvOS)
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
    
        draw?(size, UIGraphicsGetCurrentContext()!)
        let image: MYImage = UIGraphicsGetImageFromCurrentImageContext()!
    
        UIGraphicsEndImageContext()
        return image
    #elseif os(macOS)
        let image = MYImage.init(size: size)
        
        let rep = NSBitmapImageRep.init(bitmapDataPlanes: nil,
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
        draw?(size, ctx!)
        image.unlockFocus()
        return image
    #endif
}
