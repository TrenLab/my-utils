//
//  ViewController.swift
//  Click fight
//
//  Created by Optimus Prime on 30.10.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import UIKit

public func UIAlertShow(message: String) {
    UIAlertShow(title: nil, message: message, actions: nil)
}

public func UIAlertShow(title: String? = nil, message: String, actions: [UIAlertAction]?) {
    UIAlertShow(title: title, message: message, actions: actions, style: .alert)
}

public func UIAlertShow(title: String?, message: String, actions: [UIAlertAction]?, vc: UIViewController) {
    UIAlertShow(title: title, message: message, actions: actions, style: .alert, vc: vc)
}

public func UIAlertShow(title: String?, message: String, actions: [UIAlertAction]?, style: UIAlertControllerStyle) {
    UIAlertShow(
        title: title,
        message: message,
        actions: actions,
        style: style,
        vc: UIApplication.shared.windows.first!.rootViewController)
}

public func UIAlertShow(title: String?, message: String, actions: [UIAlertAction]?, style: UIAlertControllerStyle, vc: UIViewController?) {
    let _actions = (actions != nil) ? actions! : [UIAlertActionMakeCancel(title: "OK", handler: nil)]
    
    let ctrl  =  UIAlertController(title: title, message: message, preferredStyle: style)
    for action in _actions {
        ctrl.addAction(action)
    }
    
    let _vc = (vc != nil) ? vc! : (UIApplication.shared.windows.first!.rootViewController)!
    
    _vc.present(ctrl, animated: true, completion: nil)
}

public func UIAlertActionMake(title: String, handler:((_ object: AnyObject)->())?) -> UIAlertAction {
    return UIAlertActionMake(title: title, style: .default, handler: handler)
}

public func UIAlertActionMakeCancel(title: String, handler:((_ object: AnyObject)->())?) -> UIAlertAction {
    return UIAlertActionMake(title: title, style: .cancel, handler: handler)
}

public func UIAlertActionMake(title: String, style: UIAlertActionStyle, handler:((_ object: AnyObject)->())?)  -> UIAlertAction {
    return UIAlertAction(title: title, style: style, handler: handler)
}
