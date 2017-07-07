//
//  ViewController.swift
//  Click fight
//
//  Created by Optimus Prime on 30.10.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import UIKit

// MARK: - Show

/**
 Presents `UIAlertController` with specified parameters.
 - Parameters:
    - title: The title of the alert.
    - message: Descriptive text that provides additional details about the reason for the alert.
    - actions: The actions array to display as part of the alert.
    - style: The style to use when presenting the alert controller.
    - vc: Controller which presents an alert view controller modally.
*/
public func UIAlertShow(title: String? = nil, message: String, actions: [UIAlertAction] = [UIAlertActionMakeCancel(title: "OK", handler: nil)], style: UIAlertControllerStyle = .alert, vc: UIViewController) {
    let ctrl = UIAlertController(title: title, message: message, preferredStyle: style)
    for action in actions {
        ctrl.addAction(action)
    }
    vc.present(ctrl, animated: true, completion: nil)
}

// MARK: - Make

/**
 Creates and returns a default action with the specified title and behavior.
 - Parameters:
    - title: The title of the alert.
    - handler: A block to execute when the user selects the action.
 */
public func UIAlertActionMake(title: String, handler:((_ object: AnyObject)->())?) -> UIAlertAction {
    return UIAlertActionMake(title: title, style: .default, handler: handler)
}

/**
  Creates and returns a cancel action with the specified title and behavior.
 - Parameters:
    - title: The title of the alert.
    - handler: A block to execute when the user selects the action.
 */
public func UIAlertActionMakeCancel(title: String, handler:((_ object: AnyObject)->())?) -> UIAlertAction {
    return UIAlertActionMake(title: title, style: .cancel, handler: handler)
}

/**
  Creates and returns an action with the specified title, style and behavior.
 - Parameters:
    - title: The title of the alert.
    - style: Additional styling information to apply to the button.
    - handler: A block to execute when the user selects the action.
 */
public func UIAlertActionMake(title: String, style: UIAlertActionStyle, handler:((_ object: AnyObject)->())?)  -> UIAlertAction {
    return UIAlertAction(title: title, style: style, handler: handler)
}
