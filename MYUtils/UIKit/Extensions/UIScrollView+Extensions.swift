//
//  UIScrollView+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 07.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import UIKit

// MARK: - Position

public extension UIScrollView {
    
    enum Position {
        
        case top
        
        case right
        
        case bottom
        
        case left
        
        case center
    }
    
    public var position: Position {
        switch direction {
        case   .vertical:
            if contentOffset.y <= 0.0 {
                return .top
            } else if contentOffset.y >= (contentSize.height - frame.size.height) {
                return .bottom
            } else {
                return .center
            }
        case .horizontal:
            if contentOffset.x >= (contentSize.width - frame.size.width) {
                return .right
            } else if contentOffset.x <= 0.0 {
                return .left
            } else {
                return .center
            }
        }
    }

    public var onTop: Bool {
        return position == .top
    }
    
    public var onRight: Bool {
        return position == .right
    }
    
    public var onBottom: Bool {
        return position == .bottom
    }
    
    public var onLeft: Bool {
        return position == .left
    }
    
    public var inCenter: Bool {
        return position == .center
    }
}

// MARK: - Direction

public extension UIScrollView {
    
    enum Direction {
        
        case vertical
        
        case horizontal
    }
    
    public var direction: Direction {
        return contentSize.height > contentSize.width ? .vertical : .horizontal;
    }
    
    public var isVertical: Bool {
        return direction == .vertical
    }
    
    public var isHorizontal: Bool {
        return direction == .horizontal
    }
}

// MARK: - Size

public extension UIScrollView {
    
    public var size: CGSize {
        return CGSize(width: contentSize.width - frame.size.width,
                     height: contentSize.height - frame.size.height)
    }
}
