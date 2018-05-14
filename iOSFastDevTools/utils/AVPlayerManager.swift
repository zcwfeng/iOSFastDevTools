//
//  AVPlayerManager.swift
//  iOSFastDevTools
//
//  Created by zcw on 2018/5/14.
//  Copyright © 2018年 zcw. All rights reserved.
//

import UIKit

import UIKit
import AVFoundation

class AVPlayerManager: NSObject {
    /**
     单例模式
     */
    static let sharedPlayerManager = AVPlayerManager()
    let speechSynthesizer = AVSpeechSynthesizer()
    func playSound(soundText:String) -> Void {
        let av = AVSpeechUtterance.init(string: soundText)
        
        let countryCode = "en"
        let voice = AVSpeechSynthesisVoice.init(language: countryCode)
        //声音，0~1
        av.volume = 1.0
        //音调0.5~2
        av.pitchMultiplier = 0.5;
        av.voice = voice
        //语速,0~1
        av.rate *= 0.7
        speechSynthesizer.speak(av)
        
        //        //播放前的延时
        //        av.preUtteranceDelay = 3;
        //        //播放后的延时，一般用于设置连续播放多段文字的间隔
        //        av.postUtteranceDelay = 1;
    }
}

