//
//  Model.swift
//  InstaCollage
//
//  Created by Optimus Prime on 07.02.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Types

public typealias MYJSONType = [String: Any]

public typealias MYJSONArrayType = [MYJSONType]

// MARK: - MYJSON

public enum MYJSON: RawRepresentable, Equatable {
    
    public typealias RawValue = Any
    
    case value(MYJSONType)
    
    case array(MYJSONArrayType)
    
    // MARK: - Object LifeCycle
    
    public init?(rawValue: Any) {
        switch rawValue {
        case      is MYJSONType: self = .value(rawValue as! MYJSONType)
        case is MYJSONArrayType: self = .array(rawValue as! MYJSONArrayType)
        default: return nil
        }
    }

    // MARK: - RawRepresentable
    
    public var rawValue: RawValue {
        return self as RawValue
    }
    
    // MARK: - Equatable
    
    public static func ==(lhs: MYJSON, rhs: MYJSON) -> Bool {
        if lhs.isValue && rhs.isValue {
            return lhs.value! == rhs.value!
        } else if lhs.isArray && rhs.isArray {
            return lhs.array! == rhs.array!
        }
        return false
    }
    
    public var value: MYJSONType? {
        if case .value(let json) = self {
            return json
        }
        return nil
    }
    
    public var array: MYJSONArrayType? {
        if case .array(let array) = self {
            return array
        }
        return nil
    }
    
    // MARK: - Is
    
    public var isValue: Bool {
        if case .value(_) = self {
            return true
        } else {
            return false
        }
    }
    
    public var isArray: Bool {
        if case .array(_) = self {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Handle
    
    public func handle(value: (MYJSONType) -> MYJSON, array: (MYJSONArrayType) -> MYJSON) -> MYJSON {
        switch self {
        case      .value(let json): return value(json)
        case .array(let jsonArray): return array(jsonArray)
        }
    }
}

// MARK: - Serizlizable

public protocol MYJSONSerizlizable {
    var json: MYJSON {get}
}

// MARK: - Deserizlizable

public protocol MYJSONDeserizlizable {
    init(json: MYJSON)
}
