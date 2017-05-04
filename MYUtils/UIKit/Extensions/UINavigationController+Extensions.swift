//
//  UINavigationViewController+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 26.02.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import UIKit

public extension UINavigationController {
    public var rootViewController: UIViewController? {
        return viewControllers.first
    }
}
