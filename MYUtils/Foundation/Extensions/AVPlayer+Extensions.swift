//
//  AVPlayer+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 17.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import AVFoundation

// MARK: - PlaybackState

public extension AVPlayer {
    
    public enum PlaybackStatus: Int {
        
        case play
        
        case pause
        
        public init(rate: Float) {
            if rate == 0.0 {
                self = .pause
            } else {
                self = .play
            }
        }
    }
    
    public var state: PlaybackStatus {
        return PlaybackStatus(rate: rate)
    }
    
    public var isPlaying: Bool {
        return state == .play
    }
    
    public var isPaused: Bool {
        return state == .pause
    }
}

// MARK: - State

public extension AVPlayer {

    public var isUnknown: Bool {
        return status == .unknown
    }
    
    public var isReady: Bool {
        return status == .readyToPlay
    }
    
    public var isFailed: Bool {
        return status == .failed
    }
}

// MARK: - Control

public extension AVPlayer {
    
    public var playbackLoops: Bool {
        set {
            actionAtItemEnd = newValue ? .none : .pause
        }
        get {
            return actionAtItemEnd == .none
        }
    }
    
    public func playFromBeginning() {
        seekToBegin()
        play()
    }

    public func seekToBegin() {
        pause()
        seek(to: kCMTimeZero)
    }
    
    public func stop() {
        pause()
        replaceCurrentItem(with: nil)
    }
}
