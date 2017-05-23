//
//  ViewController.swift
//  Click fight
//
//  Created by Optimus Prime on 30.10.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import UIKit

// MARK: - Alert Show

public func UIAlertShow(title: String? = nil, message: String, actions: [UIAlertAction] = [UIAlertActionMakeCancel(title: "OK", handler: nil)], style: UIAlertControllerStyle = .alert, vc: UIViewController) {
    
    let ctrl = UIAlertController(title: title, message: message, preferredStyle: style)
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
