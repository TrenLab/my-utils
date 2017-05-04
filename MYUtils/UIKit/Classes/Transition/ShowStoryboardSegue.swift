//
//  ShowStoryboardSegue.swift
//  Click fight
//
//  Created by Optimus Prime on 15.12.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import UIKit

@objc(ShowStoryboardSegue)
class ShowStoryboardSegue: UIStoryboardSegue {

    // MARK: - Pepform
    
    override func perform() {
        source.addChild(viewController: destination)
    }
}
