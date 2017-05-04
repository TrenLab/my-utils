//
//  URL+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 16.02.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

public extension URL {
    
    var queriesDictionary: [String: String] {
        guard query != nil else {
            return [:]
        }
        
        var dictionary = [String: String]()
        query!.components(separatedBy: "&").enumerate {_, value in
            let param = value.components(separatedBy: "=")
            dictionary[param[0]] = param[1]
        }
        
        return dictionary
    }
    
    var queriesArray: [String] {
        guard query != nil else {
            return []
        }

        return query!.components(separatedBy: "&")
    }
}
