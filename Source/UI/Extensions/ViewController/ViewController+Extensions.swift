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

// MARK: - Get Childs

#if os(iOS) || os(tvOS) || os(OSX)
public extension MYViewControllerType {
    /**
     Returns the last child view controller if it is exists. Otherwise returns `nil`.
     */
    public var currentViewController: MYViewControllerType? {
        return childViewControllers.last
    }
    
    /**
     Returns the previous child view controller if it is exists. Otherwise returns `nil`.
     */
    public var previousViewController: MYViewControllerType? {
        return childViewControllers.count < 2 ? nil : childViewControllers[childViewControllers.count - 2]
    }
}

// MARK: - Add / Remove Child

public extension MYViewControllerType {
    /**
     Adds the specified view controller as a child of the current view controller.
     - Parameters:
        - viewController: The view controller to be added as a child.
        - closure: Performs after viewController been added to receiver as child view controller.
     */
    public func addChild(viewController vc: MYViewControllerType, closure: (() -> Void)? = nil) {
        addChildViewController(vc)
        vc.view.frame = view.bounds
        
        closure?()
        view.addSubview(vc.view)
        
        #if os(iOS) || os(tvOS)
            vc.didMove(toParentViewController: self)
        #endif
    }

    /**
     Removes child view controllers.
    */
    public func removeChildViewControllers() {
        for ctrl in childViewControllers {
            ctrl.removeFromSuperViewController()
        }
    }
    
    /**
     Removes child view controller.
     - Parameters:
        - viewController: The view controller to be removed from it's parent view controller.
        - closure: Performs after viewController been removed from it's parent view controller.
     */
    public func removeChild(viewController vc: MYViewControllerType, closure: (() -> Void)? = nil) {
        vc.removeFromSuperViewController(closure: closure)
    }
    
    /**
     Removes child view controller.
     - Parameters:
        - closure: Performs after viewController been removed from it's parent view controller.
     */
    public func removeFromSuperViewController(closure: (() -> Void)? = nil) {
        #if os(iOS) || os(tvOS)
            willMove(toParentViewController: nil)
        #endif
        
        view.removeFromSuperview()
        removeFromParentViewController()
        closure?()
    }
}
#endif
