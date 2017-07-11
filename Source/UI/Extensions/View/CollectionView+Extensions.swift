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
    import AppKit
#endif

// MARK: - MYCollectionViewType / MYCollectionViewFlowLayoutType

#if os(iOS)
    /**
     Platform independet CollectionView type.
    */
    public typealias MYCollectionViewType = UICollectionView
    
    /**
     Platform independet CollectionViewFlowLayout type.
     */
    public typealias MYCollectionViewFlowLayoutType = UICollectionViewFlowLayout
#elseif os(tvOS)
    /**
     Platform independet CollectionView type.
     */
    public typealias MYCollectionViewType = UICollectionView
    
    /**
     Platform independet CollectionViewFlowLayout type.
     */
    public typealias MYCollectionViewFlowLayoutType = UICollectionViewFlowLayout
#elseif os(OSX)
    /**
     Platform independet CollectionView type.
     */
    public typealias MYCollectionViewType = NSCollectionView
    
    /**
     Platform independet CollectionView type.
     */
    @available(OSX 10.11, *)
    public typealias MYCollectionViewFlowLayoutType = NSCollectionViewFlowLayout
#endif

// MARK: - Collection Layout

#if os(iOS) || os(tvOS) || os(OSX)
@IBDesignable public extension MYCollectionViewType {
    /**
     Adjusts lauoyt item size corrensponding the specified number of cell per row.
     */
    @available(OSX 10.11, *)
    @IBInspectable public var numberOfCellsPerRow: UInt {
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
    
    /**
     Current collection view layout.
     */
    @available(OSX 10.11, *)
    public var flowLayout: MYCollectionViewFlowLayoutType? {
        return collectionViewLayout as? MYCollectionViewFlowLayoutType
    }
}
#endif
