//
//  Track.swift
//  MusicControls
//
//  Created by Ford on 7/18/20.
//  Copyright © 2020 MinhTon. All rights reserved.
//

import Foundation

open class Track: NSObject {
    
    open var id: String? {
        get { return MusicControls.executeAppleScriptWithString("get id of current track") }
    }
    
    open var title: String? {
        get { return MusicControls.executeAppleScriptWithString("get name of current track") }
    }
    
    open var artist: String? {
        get { return MusicControls.executeAppleScriptWithString("get artist of current track") }
    }
    
    open var albumArtist: String? {
        get { return MusicControls.executeAppleScriptWithString("get album artist of current track") }
    }
    
    open var artworkUrl: String? {
        get { return MusicControls.executeAppleScriptWithString("get artwork url of current track") }
    }
    
    open var positionPercentage: Double {
        get {
            let d = duration
            if d == 0.0 { return 0}
            return position/d
        }
        set {
            let d = duration
            if d == 0.0 { return }
            _ = MusicControls.executeAppleScriptWithString("set player position to \(d * newValue)")
            return
        }
        
    }
    
    open var position: Double {
        get {
            if let pos = MusicControls.executeAppleScriptWithString("get player position") {
                if let val = Double(pos) {
                    return val
                }
            }
            return 0
        }
    }
    
    open var duration: Double {
        get {
            if let pos = MusicControls.executeAppleScriptWithString("get duration of current track") {
                if let val = Double(pos) {
                    return val/1000
                }
            }
            return 0
        }
    }
}
