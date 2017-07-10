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
    
    /**
     Sets the NSCoding value of the specified default key in the standard application domain.
     - Parameters:
        - value: The object to store in the defaults database. Should conform to NSCoding protocol.
        - key: The key with which to associate with the value.
     */
    public func set<T: NSCoding>(_ object: T, forKey key: String) {
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: object)
        set(archivedData, forKey: key)
    }
    
    /**
     Returns the unatchived object associated with the first occurrence of the specified default.
     - Parameters:
        - key: A key in the current user's defaults database.
     */
    public func object<T: NSCoding>(forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: data) as? T
        }
        return nil
    }
}

// MARK: - Subscript

public extension UserDefaults {
    
    /**
     Sets / returns the value of the specified default key in the standard application domain.
     - Parameters:
        - key: The key with which to associate with / get the value
     */
    public subscript(key: String) -> Any? {
        set {
            set(newValue, forKey: key)
        }
        get {
            return object(forKey: key)
        }
    }
}
