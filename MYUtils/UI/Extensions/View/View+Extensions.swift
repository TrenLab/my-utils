//
//  UIView+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - Typealias

#if os(iOS)
    public typealias MYView  = UIView
    public typealias MYColor = UIColor
#elseif os(tvOS)
    public typealias MYView  = UIView
    public typealias MYColor = UIColor
#elseif os(OSX)
    public typealias MYView  = NSView
    public typealias MYColor = NSColor
#endif

// MARK: - Layer

@IBDesignable public extension MYView {
    @IBInspectable public var borderColor: MYColor? {
        set {
            #if os(iOS) || os(tvOS)
                layer.borderColor = newValue?.cgColor
            #elseif os(OSX)
                layer?.borderColor = newValue?.cgColor
            #endif
        }
        get {
            #if os(iOS) || os(tvOS)
                return MYColor(cgColor: layer.borderColor!)
            #elseif os(OSX)
                return layer != nil ? MYColor(cgColor: layer!.borderColor!) : nil
            #endif
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        set {
            #if os(iOS) || os(tvOS)
                layer.borderWidth = newValue
            #elseif os(OSX)
                layer?.borderWidth = newValue
            #endif

        }
        get {
            #if os(iOS) || os(tvOS)
                return layer.borderWidth
            #elseif os(OSX)
                return layer != nil ? layer!.borderWidth : 0.0
            #endif
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        set {
            #if os(iOS) || os(tvOS)
                layer.cornerRadius = newValue
            #elseif os(OSX)
                layer?.cornerRadius = newValue
            #endif
        }
        get {
            #if os(iOS) || os(tvOS)
                return layer.cornerRadius
            #elseif os(OSX)
                return layer != nil ? layer!.cornerRadius : 0.0
            #endif
        }
    }
}
