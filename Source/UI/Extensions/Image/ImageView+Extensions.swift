//
//  UIImageView+Extensions.swift
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

// MARK: - Load

public extension MYImageView {
    /**
     Downloads and sets image from specified url.
     - Parameters:
        - url: Image resource url.
        - completion: The completion closure to be executed when operation has been completed.
     */
    public func imageFrom(URL url: URL, completion: MYImageDownloadCompletion? = nil) {
        MYImage.from(URL: url) {image in
            guard let img = image else {
                completion?(nil)
                return
            }
            
            #if os(iOS)
                self.image = img
            #elseif os(watchOS)
                self.setImage(img)
            #elseif os(tvOS)
                self.image = img
            #elseif os(OSX)
                self.image = img
            #endif

            completion?(img)
        }
    }
}
