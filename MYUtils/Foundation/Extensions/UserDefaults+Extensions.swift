//
//  a.swift
//  Click fight
//
//  Created by Optimus Prime on 01.12.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - NSCoding

public extension UserDefaults {
    public func set<T: NSCoding>(_ object: T, forKey key: String) {
        set(NSKeyedArchiver.archivedData(withRootObject: object), forKey: key)
    }
    
    public func object<T: NSCoding>(forKey: String) -> T? {
        if let data = object(forKey: forKey) as? Data {
            return NSKeyedUnarchiver(forReadingWith: data) as? T
        }
        return nil
    }
}

// MARK: - Subscript

public extension UserDefaults {
    public subscript(key: String) -> Any? {
        set {
            set(newValue, forKey: key)
        }
        get {
            return object(forKey: key)
        }
    }
}
