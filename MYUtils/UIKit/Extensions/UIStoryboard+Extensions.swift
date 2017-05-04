//
//  UIStoryboard+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 07.12.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import UIKit

public func UIStoryboardViewController(name: String, bundle storyboardBundleOrNil: Bundle?, vcIdentifier: String?) -> UIViewController? {
    
    return (vcIdentifier != nil) ? UIStoryboard(name: name, bundle: storyboardBundleOrNil).instantiateViewController(withIdentifier:vcIdentifier!) : UIStoryboard(name: name, bundle: storyboardBundleOrNil).instantiateInitialViewController()
}

