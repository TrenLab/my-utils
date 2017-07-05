//
//  UIScrollView+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 07.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

// MARK: - MYScrollViewType

#if os(iOS)
    public typealias MYScrollViewType = UIScrollView
#elseif os(tvOS)
    public typealias MYScrollViewType = UIScrollView
#elseif os(OSX)
    public typealias MYScrollViewType = NSScrollView
#endif

// MARK: - MYScrollViewPosition

public enum MYScrollViewPosition: Int {
    
    case top = 0
    
    case right
    
    case bottom
    
    case left
    
    case center
}

// MARK: - ScrollView Scroll Position

public extension MYScrollViewType {
    public var position: MYScrollViewPosition {
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
    
    #if os(OSX)
        public var contentOffset: CGPoint {
            return documentVisibleRect.origin
        }
    #endif
}

// MARK: - MYScrollViewDirection

public enum MYScrollViewDirection: Int {
    
    case vertical = 0
    
    case horizontal
}

// MARK: - ScrollView Scroll Direction

public extension MYScrollViewType {
    public var direction: MYScrollViewDirection {
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

public extension MYScrollViewType {
    public var size: CGSize {
        return CGSize(width: contentSize.width - frame.size.width, height: contentSize.height - frame.size.height)
    }
}
