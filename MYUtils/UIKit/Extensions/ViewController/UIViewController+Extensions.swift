//
//  UIViewController+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 07.12.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

public extension UIViewController {
    public var currentViewController: UIViewController? {return childViewControllers.last}
    public var previousViewController: UIViewController? {
        return childViewControllers.count < 2 ? nil : childViewControllers[childViewControllers.count - 2]
    }
}

public extension UIViewController {
    // MARK: - Add
    
    public func addChild(viewController vc: UIViewController, closure: ((Void) -> Void)? = nil) {
        addChildViewController(vc)
        vc.view.frame = view.bounds
        if closure == nil {view.addSubview(vc.view)}
        closure?()
        vc.didMove(toParentViewController: self)
    }
    
    // MARK: - Remove
    
    func removeChild(viewController vc: UIViewController, closure: ((Void) -> Void)? = nil) {
        vc.removeFromSuperViewController(closure: closure)
    }
    
    public func removeFromSuperViewController(closure: ((Void) -> Void)? = nil) {
        willMove(toParentViewController: nil)
        view.removeFromSuperview()
        removeFromParentViewController()
        closure?()
    }
}
