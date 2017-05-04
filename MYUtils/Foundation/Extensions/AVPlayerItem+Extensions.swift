//
//  AVPlayerItem+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 22.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import AVFoundation

// MARK: - Keys

public extension AVPlayerItem {
    
    public static let StatusKey = #keyPath(AVPlayerItem.status)
    public static let BufferEmptyKey = #keyPath(AVPlayerItem.isPlaybackBufferEmpty)
    public static let PlaybackKeepUpKey = #keyPath(AVPlayerItem.isPlaybackLikelyToKeepUp)
    public static let LoadedTimeRangesKey = #keyPath(AVPlayerItem.loadedTimeRanges)

    public static let BasicKeys: [String] = [StatusKey, BufferEmptyKey, PlaybackKeepUpKey]
}

// MARK: - Buffer

public extension AVPlayerItem {
    
    public enum BufferState: Int {
        
        case unknown = 0
        
        case delayed
        
        case ready
    }
    
    public var bufferState: BufferState {
        return isPlaybackBufferFull ? .ready : .delayed
    }
}

// MARK: - Is

public extension AVPlayerItem {
    
    public var isReady: Bool {
        return status == .readyToPlay
    }
}

// MARK: - Load

public extension AVPlayerItem {
    
    public func stopLoad() {
        asset.cancelLoading()
        cancelPendingSeeks()
    }
}
