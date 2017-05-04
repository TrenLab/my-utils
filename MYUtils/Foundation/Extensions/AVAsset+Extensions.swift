//
//  AVAsset+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 17.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import UIKit
import AVFoundation

public extension AVAsset {
    
    public static let PlayableKey   = "playable"
    public static let ExportableKey = "exportable"
    public static let ReadableKey   = "readable"
    public static let ComposableKey = "composable"
    public static let TracksKey     = "tracks"
    public static let DurationKey   = "duration"
    
    public static let HasProtectedContentKey            = "hasProtectedContent"
    public static let CompatibleWithSavedPhotosAlbumKey = "compatibleWithSavedPhotosAlbum"
    public static let CompatibleWithAirPlayVideo        = "CompatibleWithAirPlayVideo"
    
    public static let BasicKeys: [String] = [PlayableKey, ExportableKey, ReadableKey, ComposableKey, TracksKey, DurationKey]

    public func loadBasicValuesAsynchronously(completionHandler: (() -> Void)? = nil) {
        loadValuesAsynchronously(forKeys: AVAsset.BasicKeys, completionHandler: completionHandler)
    }
}

public extension AVAsset {
    
    public func screenShot(seconds: Double = 0, timescale: CMTimeScale = 1) -> UIImage? {
        let imageGenerator = AVAssetImageGenerator(asset: self)
        let screenshotTime = CMTime(seconds: seconds, preferredTimescale: timescale)
        
        if let imageRef = try? imageGenerator.copyCGImage(at: screenshotTime, actualTime: nil) {
            return UIImage(cgImage: imageRef)
        }
        
        return nil
    }
}
