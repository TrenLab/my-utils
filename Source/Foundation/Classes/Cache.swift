//
//  Cache.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Cache

/**
 A mutable collection you use to temporarily store transient key-value pairs that are subject to eviction when resources are low.
 */
open class Cache {
    
    open internal(set) static var caches = [String: Cache]()
    
    open internal(set) var cache: NSCache = NSCache<NSString, AnyObject>()

    open internal(set) var name: String
    
    // MARK: - Object LifeCycle
    
    /**
     Creates and returns cache with specified name.
     If cache with specified name already exists, method returns existed cache.
     - Parameters: 
        - name: Cache name.
     */
    open class func create(withName name: String) -> Cache {
        if let cache = Cache.caches[name] {
            return cache
        }
        let cache = Cache(name: name)
        Cache.caches[name] = cache
        return cache
    }
    
    fileprivate init(name: String) {
        self.name  = name
        cache.name = name
    }
    
    deinit {
        clear()
    }
    
    // MARK: - Get
    
    /**
     Returns cache with specified name if it's exist. Otherwise returns nil.
     */
    open class func with(name nm: String) -> Cache? {
        return Cache.caches[nm]
    }
    
    // MARK: - Clear
    
    /**
     Clears all created caches.
     */
    open class func clear() {
        caches.forEach {
            $0.value.clear()
        }
    }
    
    /**
     Removes all stores objects.
     */
    open func clear() {
        cache.removeAllObjects()
    }

    // MARK: - Subscript
    
    /**
     Returns value for key if cache contains сorresponding key value.
     Otherwise, returns `nil` if there is no сorresponding key value.
     - Parameters:
        - key: A key to find in the cache.
     */

    open subscript(key: String) -> AnyObject? {
        set {
            guard let new = newValue else {
                cache.removeObject(forKey: key.ns_string)
                return
            }
            cache.setObject(new, forKey: key.ns_string)
        }
        get {
            return cache.object(forKey: key.ns_string)
        }
    }
}

// MARK: - Equatable

extension Cache: Equatable {
    public static func ==(lhs: Cache, rhs: Cache) -> Bool {
        return lhs.name == rhs.name
    }
}
