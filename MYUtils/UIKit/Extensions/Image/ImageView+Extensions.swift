//
//  UIImageView+Extensions.swift
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

// MARK: - Types

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - Load

public extension UIImageView {
    
    public func imageFrom(URLString string: String, completion: MYImageDownloadCompletion? = nil) {
        imageFrom(URL: URL(string: string)!, completion: completion)
    }
    
    public func imageFrom(URL url: URL, completion: MYImageDownloadCompletion? = nil) {
        UIImage.from(URL: url) {image in
            guard let img = image else {
                completion?(nil)
                return
            }
            
            self.image = img
            completion?(img)
        }
    }
}
