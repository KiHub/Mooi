//
//  PlayerView.swift
//  Mooi
//
//  Created by  Mr.Ki on 01.12.2022.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    @Environment (\.managedObjectContext) var managedObjectContext
    var meditationVM: MeditationViewModel
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @State var opacity = 0.0
    @State var meditationDays: Set<Date> = []
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
            
            Rectangle()
                .fill(LinearGradient(colors: [Color("dark"), .clear], startPoint: .bottom, endPoint: .top))
                .opacity(0.9)
                .ignoresSafeArea()
            
            MorphingCircle()
                .animation(.easeInOut, value: 2)
                .frame(width: UIScreen.main.bounds.width)
                .opacity(opacity)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 4)
                    
                    withAnimation(baseAnimation) {
                        opacity = 0.8
                    }
                }
            
            
            VStack(spacing: 28) {
                HStack() {
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
            DataManager().addDate(context: managedObjectContext)
          //  $meditationDays.append(Date())
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
