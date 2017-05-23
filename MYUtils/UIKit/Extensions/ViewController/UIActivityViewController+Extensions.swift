//
//  UIActivityViewController+Extensions.swift
//  Click fight
//
//  Created by Optimus Prime on 24.11.16.
//  Copyright © 2016 Tren Lab. All rights reserved.
//

#if os(iOS)
    import UIKit
#endif

#if os(iOS)
public extension UIActivityViewController {
    public convenience init(activityItems: [Any], applicationActivities: [UIActivity]?, closure:UIActivityViewControllerCompletionWithItemsHandler? = nil) {        
    self.init(activityItems: activityItems, applicationActivities: applicationActivities)
    completionWithItemsHandler = closure
    }
}
#endif
