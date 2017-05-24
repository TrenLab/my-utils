//
//  UICollectionView+Extensions.swift
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
    import Cocoa
#endif

// MARK: - Typealias

#if os(iOS)
    public typealias MY_COLLECTION_VIEW = UICollectionView
    public typealias MY_COLLECTION_VIEW_FLOW_LAYOUT = UICollectionViewFlowLayout
#elseif os(tvOS)
    public typealias MY_COLLECTION_VIEW = UICollectionView
    public typealias MY_COLLECTION_VIEW_FLOW_LAYOUT = UICollectionViewFlowLayout
#elseif os(OSX)
    public typealias MY_COLLECTION_VIEW = NSCollectionView
    
    @available(OSX 10.11, *)
    public typealias MY_COLLECTION_VIEW_FLOW_LAYOUT = NSCollectionViewFlowLayout
#endif

// MARK: - Collection

public extension MY_COLLECTION_VIEW {
    @available(OSX 10.11, *)
    public var numberOfCellsPerRow: UInt {
        set {
            guard let layout = flowLayout else {
                return
            }
            let new = CGFloat(newValue)
            let marginsAndInsets = layout.sectionInset.left + layout.sectionInset.right + layout.minimumInteritemSpacing*(new - 1)
            
            let itemWidth = (bounds.size.width - marginsAndInsets) / new
            layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        }
        get {
            guard let layout = flowLayout else {
                return 0
            }
            
            let width = layout.itemSize.width
            return UInt(floor(frame.width / width))
        }
    }
    
    @available(OSX 10.11, *)
    public var flowLayout: MY_COLLECTION_VIEW_FLOW_LAYOUT? {
        return collectionViewLayout as? MY_COLLECTION_VIEW_FLOW_LAYOUT
    }
}
