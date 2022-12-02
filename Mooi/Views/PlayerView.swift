//
//  PlayerView.swift
//  Mooi
//
//  Created by  Mr.Ki on 01.12.2022.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    var meditationVM: MeditationViewModel
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    let timer = Timer.publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    var body: some View {
        ZStack {
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.2)
                .ignoresSafeArea()
            
                VStack(spacing: 28) {
                    HStack {
                    Button {
                        audioManager.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color("light"))
                    }
                        Spacer()
                    }
                    Text(meditationVM.meditation.title)
                        .font(.title)
                        .foregroundColor(Color("light"))
                    Spacer()
                    if let player = audioManager.player {
                    VStack(spacing: 10) {
                        
                        Slider(value: $value, in: 0...player.duration) { editing in
                            
                            print("editing", editing)
                            isEditing = editing
                            if !editing {
                                player.currentTime = value
                            }
                        }
                        
                            .accentColor(Color("light"))
                        HStack {
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            Spacer()
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                        }
                        .font(.caption)
                        .foregroundColor(Color("light"))
                    }
                    HStack {
                        let color: Color = audioManager.isLooping ? Color("dark") : Color("light")
                        PlaybackButton(systemName: "repeat", color: color) {
                            audioManager.toggleLoop()
                        }
                        Spacer()
                        PlaybackButton(systemName: "gobackward.15") {
                            player.currentTime -= 15
                        }
                        Spacer()
                        PlaybackButton(systemName: audioManager.isPlaying ? "pause.rectangle.fill" : "play.rectangle.fill", fontSize: 50) {
                            audioManager.playPause()
                        }
                        Spacer()
                        PlaybackButton(systemName: "goforward.15") {
                            player.currentTime += 15
                        }
                        Spacer()
                        PlaybackButton(systemName: "stop.fill") {
                            audioManager.stop()
                            dismiss()
                        }
                    }
                    }
                }
                .padding()
            

        }
        .onAppear {
            audioManager.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else {return}
            value = player.currentTime
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let medidtaionVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        PlayerView(meditationVM: medidtaionVM, isPreview: true)
            .environmentObject(AudioManager())
    }
}
