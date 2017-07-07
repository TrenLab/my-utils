//
//  UIActivityViewController+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 24.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

import UIKit

// MARK: - LifeCycle

public extension UIActivityViewController {
    /**
     Initializes and returns a new activity view controller object that acts on the specified data.
     - Parameters:
        - activityItems: The array of data objects on which to perform the activity.
        - applicationActivities: An array of `UIActivity` objects representing the custom services that your application supports.
        - closure: The completion handler to execute after the activity view controller is dismissed.
     */
    public convenience init(activityItems: [Any], applicationActivities: [UIActivity]?, closure:UIActivityViewControllerCompletionWithItemsHandler? = nil) {
        self.init(activityItems: activityItems, applicationActivities: applicationActivities)
        completionWithItemsHandler = closure
    }
}
