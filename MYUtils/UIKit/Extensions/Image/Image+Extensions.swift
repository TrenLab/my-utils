//
//  UIImage+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - MYImageOrientation

public enum MYImageOrientation {
    
    case portret
    
    case album
    
    case square
    
    fileprivate init(size: CGSize) {
        if size.width < size.height {
            self = .portret
        } else if size.width > size.height {
            self = .album
        } else {
            self = .square
        }
    }
}

// MARK: - Image Orientation

public extension MY_IMAGE {
    public var proportions: MYImageOrientation {
        return MYImageOrientation(size: size)
    }
    
    public var isPortret: Bool {
        return proportions == .portret
    }
    
    public var isAlbum: Bool {
        return proportions == .album
    }
    
    public var isSquare: Bool {
        return proportions == .square
    }
}

// MARK: - Load

public extension MY_IMAGE {
    public static func from(URLString string: String, completion: MYImageDownloadCompletion? = nil) {
        from(URL: URL(string: string)!, completion: completion)
    }
    
    public static func from(URL url: URL, completion: MYImageDownloadCompletion? = nil) {
        if let cachedImageData = ImageCache()[url.absoluteString] {
            completion?(UIImage(data: cachedImageData as! Data))
            return
        }
        
        DispatchQueue.global().async {
            var img: UIImage? = nil
            
            if let imgData = try? Data(contentsOf: url) {
                img = UIImage(data: imgData)
                ImageCache()[url.absoluteString] = imgData as AnyObject?
            }
            
            DispatchQueue.main.async {
                completion?(img)
            }
        }
    }
}
