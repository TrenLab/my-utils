//
//  UIViewController+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 07.12.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: - Childs

public extension MYViewController {
    
    // MARK: - Current
    
    public var currentViewController: MYViewController? {
        return childViewControllers.last
    }
    
    // MARK: - Previous
    
    public var previousViewController: MYViewController? {
        return childViewControllers.count < 2 ? nil : childViewControllers[childViewControllers.count - 2]
    }
}

// MARK: Add / Remove Child

public extension MYViewController {
    
    // MARK: - Remove Child
    
    public func addChild(viewController vc: MYViewController, closure: ((Void) -> Void)? = nil) {
        addChildViewController(vc)
        vc.view.frame = view.bounds
        
        closure?()
        view.addSubview(vc.view)
        
        #if os(iOS) || os(tvOS)
            vc.didMove(toParentViewController: self)
        #endif
    }
    
    // MARK: - Remove Child

    func removeChild(viewController vc: MYViewController, closure: ((Void) -> Void)? = nil) {
        vc.removeFromSuperViewController(closure: closure)
    }
    
    public func removeFromSuperViewController(closure: ((Void) -> Void)? = nil) {
        #if os(iOS) || os(tvOS)
            willMove(toParentViewController: nil)
        #endif
        
        view.removeFromSuperview()
        removeFromParentViewController()
        closure?()
    }
}
