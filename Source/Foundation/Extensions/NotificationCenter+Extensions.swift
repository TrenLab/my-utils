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
    
    /**
     Adds an entry to the receiver’s dispatch table with a current notification queue and a block to add to the queue, and optional criteria: notification name and sender is nil.
     - Parameters:
        - name: The name of the notification for which to register the observer; that is, only notifications with this name are used to add
                the block to the operation queue.
        - block: The block to be executed when the notification is received.
     - Returns:
        An opaque object to act as the observer.
     */
    public func addObserver(forName name: NSNotification.Name, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return addObserver(forName: name, object: nil, queue: OperationQueue.current) {notification in
            block(notification)
        }
    }
    
    /**
     Adds an entry to the receiver’s dispatch table with a current notification queue and a block to add to the queue, and optional criteria: notification name and sender.
     - Parameters:
        - name: The name of the notification for which to register the observer; that is, only notifications with this name are used to add
                the block to the operation queue.
        - object: The object whose notifications the observer wants to receive; that is, only notifications sent by this sender are delivered     
                  to the observer.
        - block: The block to be executed when the notification is received.
     - Returns:
        An opaque object to act as the observer.
     */
    public func addObserver(forName name: NSNotification.Name, object anObject: Any?, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return addObserver(forName: name, object: anObject, queue: OperationQueue.current) {notification in
            block(notification)
        }
    }
}
