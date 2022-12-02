//
//  AudioManager.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import Foundation
import AVKit
final class AudioManager: ObservableObject {
    var player: AVAudioPlayer?
    @Published var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    @Published private(set) var isLooping: Bool = false
    func startPlayer(track: String, isPreview: Bool = false) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Track \(track) not found")
            return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            if isPreview {
                player?.prepareToPlay()
            } else {
            player?.play()
                isPlaying = true
            }
        } catch  {
            print("Player error", error)
        }
        
    }
    func playPause() {
        guard let player = player else {
            print("Audio player not found")
            return
        }
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }

    }
    
    func stop() {
        guard let player = player else {
            return
        }
        if player.isPlaying {
            player.stop()
            isPlaying = false
        }
        
    }
    func toggleLoop() {
        guard let player = player else {
            return
        }
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0
        print("isLooping", isLooping)
    }
}
