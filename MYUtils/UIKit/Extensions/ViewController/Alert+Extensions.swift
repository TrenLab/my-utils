//
//  ViewController.swift
//  Click fight
//
//  Created by Optimus Prime on 30.10.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(tvOS)
    import UIKit
#endif

// MARK: - Typealias

#if os(iOS)
    public typealias MYAlertAction = UIAlertAction
    public typealias MYAlertControllerStyle = UIAlertControllerStyle
    public typealias MYAlertController = UIAlertController
#elseif os(tvOS)
    public typealias MYAlertAction = UIAlertAction
    public typealias MYAlertControllerStyle = UIAlertControllerStyle
    public typealias MYAlertController = UIAlertController
#endif

// MARK: - Alert Show

public func UIAlertShow(title: String? = nil, message: String, actions: [MYAlertAction] = [UIAlertActionMakeCancel(title: "OK", handler: nil)], style: MYAlertControllerStyle = .alert, vc: MYViewController) {
    
    let ctrl = MYAlertController(title: title, message: message, preferredStyle: style)
    for action in actions {
        ctrl.addAction(action)
    }
    vc.present(ctrl, animated: true, completion: nil)
}

// MARK: - Make

public func UIAlertActionMake(title: String, handler:((_ object: AnyObject)->())?) -> UIAlertAction {
    return UIAlertActionMake(title: title, style: .default, handler: handler)
}

public func UIAlertActionMakeCancel(title: String, handler:((_ object: AnyObject)->())?) -> UIAlertAction {
    return UIAlertActionMake(title: title, style: .cancel, handler: handler)
}

public func UIAlertActionMake(title: String, style: UIAlertActionStyle, handler:((_ object: AnyObject)->())?)  -> UIAlertAction {
    return UIAlertAction(title: title, style: style, handler: handler)
}
