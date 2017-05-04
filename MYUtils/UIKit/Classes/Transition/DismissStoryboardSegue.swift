//
//  DismissStoryboardSegue.swift
//  InstaCollage
//
//  Created by Optimus Prime on 14.02.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import UIKit

@objc(DismissStoryboardSegue)
class DismissStoryboardSegue: UIStoryboardSegue {
    
    // MARK: - Pepform
    
    override func perform() {
        source.dismiss(animated: true, completion: nil)
    }
}
