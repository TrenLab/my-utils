//
//  UIView+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import UIKit

// MARK: - Draw
public func UIImageDraw(size: CGSize, draw: ((_ size: CGSize, _ context: CGContext)-> ())?) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, false, 1)
    
    draw?(size, UIGraphicsGetCurrentContext()!)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    
    UIGraphicsEndImageContext();
    return image
}

// MARK: - Layer
@IBDesignable
public extension UIView {
    @IBInspectable public var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

// MARK: - Load

public extension UIView {
    public static func from(nib nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self) as! AnyClass)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

