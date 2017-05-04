//
//  URLSessionTask+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 21.04.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

public extension URLSessionTask {
    var isWorking: Bool {
        return state == .running
    }
}
