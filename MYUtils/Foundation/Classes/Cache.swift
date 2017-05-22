//
//  Cache.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import Foundation

open class Cache {
    
    open internal(set) static var caches = [String: Cache]()

    open internal(set) var cache: NSCache = NSCache<NSString, AnyObject>()
    
    open let name: String
    
    // MARK: - Object LifeCycle
    
    public class func createCache(withName name: String) -> Cache {
        if Cache.caches[name] != nil {
            return Cache.caches[name]!
        }
        
        let cache = Cache(name: name)
        Cache.caches[name] = cache
        return Cache.caches[name]!
    }
    
    public init(name: String) {
        self.name = name
    }
    
    deinit {
        clear()
    }
    
    open func clear() {
        cache.removeAllObjects()
    }
    
    // MARK: - Control 

    
    // MARK: - Get
    
    open class func withName(_ name: String) -> Cache? {
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
