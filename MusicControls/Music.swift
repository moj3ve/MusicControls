//
//  Music.swift
//  MusicControls
//
//  Created by Ford on 7/18/20.
//  Copyright © 2020 MinhTon. All rights reserved.
//

import Foundation

open class MusicControls: NSObject {
    
    public static var currentTrack = Track()
    public static var playerState: PlayerState {
        get {
            if let state = MusicControls.executeAppleScriptWithString("get player state") {
                
                if let stateEnum = PlayerState(rawValue: state) {
                    return stateEnum
                }
            }
            return PlayerState.paused
        }
        
        set {
            switch newValue {
            case .paused:
                _ = MusicControls.executeAppleScriptWithString("pause")
            case .playing:
                _ = MusicControls.executeAppleScriptWithString("play")
            }
        }
    }
    
    
    public static func playNext(_ completionHandler: (()->())? = nil){
        _ = MusicControls.executeAppleScriptWithString("play (next track)")
        completionHandler?()
    }
    
    public static func playPrevious(_ completionHandler: (() -> ())? = nil){
        _ = MusicControls.executeAppleScriptWithString("play (previous track)")
        completionHandler?()
    }
    
    
    public static func startMusic(hidden: Bool = true, completionHandler: (() -> ())? = nil){
        let option: StartOptions
        switch hidden {
        case true:
            option = .withoutUI
        case false:
            option = .withUI
        }
        _ = MusicControls.startMusic(option: option)
        completionHandler?()
    }
    
    
    public static func activateMusic(completionHandler: (() -> ())? = nil){
        _ = MusicControls.activateMusic()
        completionHandler?()
    }
    
    static func executeAppleScriptWithString(_ command: String) -> String? {
        let myAppleScript = "if application \"Music\" is running then tell application \"Music\" to \(command)"
        
        var error: NSDictionary?
        if let scriptObject = NSAppleScript(source: myAppleScript) {
            return scriptObject.executeAndReturnError(&error).stringValue
        }
        return nil
    }
    
    
    enum StartOptions {
        case withUI
        case withoutUI
    }
    
    static func startMusic(option:StartOptions) -> String? {
        let command:String;
        switch option {
        case .withoutUI:
            command = "run"
        case .withUI:
            command = "launch"
        }
        
        let myAppleScript = "if application \"Music\" is not running then \(command) application \"Music\""
        
        var error: NSDictionary?
        if let scriptObject = NSAppleScript(source: myAppleScript) {
            return scriptObject.executeAndReturnError(&error).stringValue
        }
        return nil
    }
    
    static func activateMusic() -> String? {
        
        let myAppleScript = "activate application \"Music\""
        
        var error: NSDictionary?
        if let scriptObject = NSAppleScript(source: myAppleScript) {
            return scriptObject.executeAndReturnError(&error).stringValue
        }
        return nil
    }
}
