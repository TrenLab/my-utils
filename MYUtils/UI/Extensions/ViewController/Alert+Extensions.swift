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

// MARK: - MYAlertActionType / MYAlertActionType / MYAlertControllerType

#if os(iOS)
    public typealias MYAlertActionType = UIAlertAction
    public typealias MYAlertControllerStyleType = UIAlertControllerStyle
    public typealias MYAlertControllerType = UIAlertController
#elseif os(tvOS)
    public typealias MYAlertActionType = UIAlertAction
    public typealias MYAlertControllerStyleType = UIAlertControllerStyle
    public typealias MYAlertControllerType = UIAlertController
#endif

// MARK: - Show

public func UIAlertShow(title: String? = nil, message: String, actions: [MYAlertActionType] = [UIAlertActionMakeCancel(title: "OK", handler: nil)], style: MYAlertControllerStyleType = .alert, vc: MYViewControllerType) {
    let ctrl = MYAlertControllerType(title: title, message: message, preferredStyle: style)
    for action in actions {
        ctrl.addAction(action)
    }
    vc.present(ctrl, animated: true, completion: nil)
}

// MARK: - Make

public func UIAlertActionMake(title: String, handler:((_ object: AnyObject)->())?) -> MYAlertActionType {
    return UIAlertActionMake(title: title, style: .default, handler: handler)
}

public func UIAlertActionMakeCancel(title: String, handler:((_ object: AnyObject)->())?) -> MYAlertActionType {
    return UIAlertActionMake(title: title, style: .cancel, handler: handler)
}

public func UIAlertActionMake(title: String, style: UIAlertActionStyle, handler:((_ object: AnyObject)->())?)  -> MYAlertActionType {
    return MYAlertActionType(title: title, style: style, handler: handler)
}
