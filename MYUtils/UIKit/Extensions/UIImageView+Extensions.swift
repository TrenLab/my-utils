//
//  UIImageView+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import UIKit

// MARK: - Load

public extension UIImageView {
    
    public func imageFrom(URLString string: String, completion: UIImage.ImageDownloadCompletion? = nil) {
        imageFrom(URL: URL(string: string)!, completion: completion)
    }
    
    public func imageFrom(URL url: URL, completion: UIImage.ImageDownloadCompletion? = nil) {
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
