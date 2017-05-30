//
//  Cache.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Cache

open class Cache: Equatable {
    
    internal static var caches = [String: Cache]()
    
    open internal(set) var cache: NSCache = NSCache<NSString, AnyObject>()

    open internal(set) var name: String
    
    // MARK: - Object LifeCycle
    
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
    
    open class func with(name nm: String) -> Cache? {
        return Cache.caches[nm]
    }
    
    // MARK: - Clear
    
    open class func clear() {
        caches.forEach {
            $0.value.clear()
        }
    }
        
    open func clear() {
        cache.removeAllObjects()
    }
    
    // MARK: - Subscript
    
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
    
    // MARK: - Equatable
    
    public static func ==(lhs: Cache, rhs: Cache) -> Bool {
        return lhs.name == rhs.name
    }
}
