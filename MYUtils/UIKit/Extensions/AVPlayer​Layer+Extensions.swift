//
//  AVPlayer​Layer+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 20.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import Foundation
import AVFoundation

public extension AVPlayerLayer {
    
    public enum FillMode {
        
        case resizeAspect
        
        case resizeAspectFill
        
        case resize
        
        fileprivate init(gravity: String) {
            switch gravity {
            case     AVLayerVideoGravityResizeAspect: self = .resizeAspect
            case AVLayerVideoGravityResizeAspectFill: self = .resizeAspectFill
            default:                                  self = .resize
            }
        }
        
        fileprivate var gravityValue: String {
            switch self {
            case     .resizeAspect: return AVLayerVideoGravityResizeAspect
            case .resizeAspectFill: return AVLayerVideoGravityResizeAspectFill
            case           .resize: return AVLayerVideoGravityResize
            }
        }

    }
    
    public var videoFillMode: FillMode {
        set {
            videoGravity = newValue.gravityValue
        } get {
            return FillMode(gravity: videoGravity)
        }
    }
}
