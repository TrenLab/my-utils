//
//  JSONOperators.swift
//  InstaCollage
//
//  Created by Optimus Prime on 28.02.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Operators

infix operator <-

// MARK: - Assignment

public func <- <T>(lft: inout T?, rgt: Any?) {
    lft = Deserialize(model: lft, data: rgt)
}

public func <- <T>(lft: inout  T, rgt: Any?) {
    if let deser = Deserialize(model: lft, data: rgt) {
        lft = deser
    }
}

// MARK: - Deserizlizable

public func <- <T: MYJSONDeserizlizable>(lft: T.Type, rgt: Any?) -> T? {
    guard let right = rgt else {
        return nil
    }

    switch right {
    case is MYJSON: return lft.init(json: right as! MYJSON)
    case is      T: return right as? T
    default: break
    }
    
    return nil
}

public func <- <T: MYJSONDeserizlizable>(lft: T.Type, rgt: Any?) -> [T]? {
    guard let right = rgt else {
        return nil
    }

    var models: [T]?
    switch right {
    case is   MYJSON:
        let json = right as! MYJSON
        models = []
        for (_, value) in json {
            models!.append(lft.init(json: value as! MYJSON))
        }
    case is [MYJSON]:
        let jsonRight = right as! [MYJSON]
        models = jsonRight.make {_, json in
            return lft.init(json: json)
        }
    case is T, is [T]:
        models = right is T ? [right as! T] : right as? [T]
    default: break
    }
    
    return models
}

// MARK: - Enum

public func <- <T: RawRepresentable>(lft: inout T, rgt: Any?) {
    guard let right = rgt else {
        return
    }
    guard right is T.RawValue else {
        return
    }
    
    if let deser = Deserialize(model: lft, data: T(rawValue: right as! T.RawValue)) {
        lft = deser
    }
}

public func <- <T: RawRepresentable>(lft: inout T?, rgt: Any?) {
    guard let right = rgt else {
        return
    }
    guard right is T.RawValue else {
        return
    }
    
    lft = Deserialize(model: lft, data: T(rawValue: right as! T.RawValue))
}

// MARK: - Deserialization

public func Deserialize<T>(model: T?, data: Any?) -> T? {
    guard let _ = data else {
        return nil
    }
    guard data! is T else {
        return nil
    }

    return data as! T?
}
