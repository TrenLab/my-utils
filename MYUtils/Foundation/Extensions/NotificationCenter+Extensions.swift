//
//  NotificationCenter+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 28.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation

// MARK: - Add Observer

public extension NotificationCenter {
    public func addObserver(forName name: NSNotification.Name, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return addObserver(forName: name, object: nil, queue: OperationQueue.current) {notification in
            block(notification)
        }
    }
    
    public func addObserver(forName name: NSNotification.Name, object anObject: Any?, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return addObserver(forName: name, object: anObject, queue: OperationQueue.current) {notification in
            block(notification)
        }
    }
}
