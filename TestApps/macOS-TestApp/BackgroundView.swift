//
//  BackgroundView.swift
//  MYUtils
//
//  Created by Damon Cricket on 20.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import Cocoa

// MARK: - BackgroundView

@IBDesignable 
class BackgroundView: NSView {
    @IBInspectable var backgroundColor: NSColor = NSColor.white
    
    // MARK: - Object LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wantsLayer = true
    }
    
    // MARK: - Layer
    
    override var wantsUpdateLayer: Bool {
        return true
    }
    
    override func updateLayer() {
        layer?.backgroundColor = backgroundColor.cgColor
    }
}
