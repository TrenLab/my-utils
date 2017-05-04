//
//  UICollectionView+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 07.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import UIKit
import Foundation

public extension UICollectionView {
    
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
    
    public var flowLayout: UICollectionViewFlowLayout? {
        return collectionViewLayout as? UICollectionViewFlowLayout
    }
}
