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
    /**
     Platform independet ScrollView type.
     */
    public typealias MYScrollViewType = UIScrollView
#elseif os(tvOS)
    /**
     Platform independet ScrollView type.
     */
    public typealias MYScrollViewType = UIScrollView
#elseif os(OSX)
    /**
     Platform independet ScrollView type.
     */
    public typealias MYScrollViewType = NSScrollView
#endif

// MARK: - MYScrollViewPosition

#if os(iOS) || os(tvOS) || os(OSX)
/**
 Represents scroll view position.
 */
public enum MYScrollViewPosition: Int {
    
    case top = 0
    
    case right
    
    case bottom
    
    case left
    
    case center
}

// MARK: - ScrollView Scroll Position

public extension MYScrollViewType {
    /**
     Returns `true` if current scroll view position is in a top of conten view. Otherwise returns `false`.
     */
    public var onTop: Bool {
        return position == .top
    }
    
    /**
     Returns `true` if current scroll view position is in a right of content view. Otherwise returns `false`.
     */
    public var onRight: Bool {
        return position == .right
    }
    
    /**
     Returns `true` if current scroll view position is in a bottom of content view. Otherwise returns `false`.
     */
    public var onBottom: Bool {
        return position == .bottom
    }
    
    /**
     Returns `true` if current scroll view position is in a left of content view. Otherwise returns `false`.
     */
    public var onLeft: Bool {
        return position == .left
    }
    
    /**
     Returns `true` if current scroll view position is in a center of content view. Otherwise returns `false`.
     */
    public var inCenter: Bool {
        return position == .center
    }
    
    /**
     Returns current scroll view position.
     */
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

    #if os(OSX)
    /**
     Returns content offset of scroll view.
     */
        public var contentOffset: CGPoint {
            return documentVisibleRect.origin
        }
    #endif
}

// MARK: - MYScrollViewDirection

/**
 Represents scroll view orientation.
 */
public enum MYScrollViewOrientation: Int {
    
    case vertical = 0
    
    case horizontal
}

// MARK: - ScrollView Scroll Direction

public extension MYScrollViewType {
    /**
     Returns current scroll view orientation.
     */
    public var direction: MYScrollViewOrientation {
        return contentSize.height > contentSize.width ? .vertical : .horizontal;
    }
    
    /**
     Returns `true` if current scroll view orientation is vertical. Otherwise returns `false`.
     */
    public var isVertical: Bool {
        return direction == .vertical
    }
    
    /**
     Returns `true` if current scroll view orientation is horizontal. Otherwise returns `false`.
     */
    public var isHorizontal: Bool {
        return direction == .horizontal
    }
}

// MARK: - Size

public extension MYScrollViewType {
    
    /**
     Returns actual content size.
     */
    public var size: CGSize {
        return CGSize(width: contentSize.width - frame.size.width, height: contentSize.height - frame.size.height)
    }
}
#endif
