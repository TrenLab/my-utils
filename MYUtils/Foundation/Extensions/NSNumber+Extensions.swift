//
//  NSNumber+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 17.04.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Is 

public extension NSNumber {
    public var isBool: Bool {
        return CFBooleanGetTypeID() == CFGetTypeID(self)
    }
}
