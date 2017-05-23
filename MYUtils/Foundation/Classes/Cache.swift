//
//  Cache.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import Foundation

open class Cache {
    
    private static var caches = [String: Cache]()
    
    private let cache: NSCache = NSCache<NSString, AnyObject>()
    
    // MARK: - Object LifeCycle
    
    public static func createCache(withName name: String) -> Cache {
        if let _ = Cache.caches[name] {
            return Cache.caches[name]!
        }
        
        Cache.caches[name] = Cache()
        return Cache.caches[name]!
    }
    
    deinit {
        clear()
    }
    
    public func clear() {
        cache.removeAllObjects()
    }
    
    // MARK: - Get
    
    public static func withName(_ name: String) -> Cache? {
        return Cache.caches[name]
    }
    
    public subscript(key: String) -> AnyObject? {
        set {
            let ns_string = key.ns_string
            guard let new = newValue else {
                cache.removeObject(forKey: ns_string)
                return
            }
            cache.setObject(new, forKey: ns_string)
        } get {
            return cache.object(forKey: key.ns_string)
        }
    }
}
