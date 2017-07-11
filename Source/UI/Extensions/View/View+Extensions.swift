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
    import AppKit
#endif

// MARK: - MYColorType

#if os(iOS)
    /**
     Platform independet Color type.
     */
    public typealias MYColorType = UIColor
#elseif os(tvOS)
    /**
     Platform independet Color type.
     */
    public typealias MYColorType = UIColor
#elseif os(OSX)
    /**
     Platform independet Color type.
     */
    public typealias MYColorType = NSColor
#endif

// MARK: - Layer

#if os(iOS) || os(tvOS) || os(OSX)
@IBDesignable public extension MYViewType {
    /**
     The color of the layer’s border. Animatable.
     */
    @IBInspectable public var borderColor: MYColorType? {
        set {
            #if os(iOS) || os(tvOS)
                layer.borderColor = newValue?.cgColor
            #elseif os(OSX)
                layer?.borderColor = newValue?.cgColor
            #endif
        }
        get {
            #if os(iOS) || os(tvOS)
                return layer.borderColor != nil ? MYColorType(cgColor: layer.borderColor!) : nil
            #elseif os(OSX)
                return layer != nil ? MYColorType(cgColor: layer!.borderColor!) : nil
            #endif
        }
    }
    
    /**
     The width of the layer’s border. Animatable.
     */
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
    
    /**
     The radius to use when drawing rounded corners for the layer’s background. Animatable.
     */
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
#endif
