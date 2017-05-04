//
//  Utils.swift
//  Click fight
//
//  Created by Optimus Prime on 10.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import UIKit

func InitUtils() {
    InitReachability()
    InitCaches()
}

// MARK: - Reachability

func InitReachability() {
    let shared = Reachability.shared
    try? shared.startNotifier()
}

// MARK: - Caches

func InitCaches() {
    let _ = Cache.createCache(withName: "image")
}

func ImageCache() -> Cache {
    return Cache.withName("image")!
}
