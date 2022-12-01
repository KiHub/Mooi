//
//  PlayerView.swift
//  Mooi
//
//  Created by  Mr.Ki on 01.12.2022.
//

import SwiftUI

struct PlayerView: View {
    @State private var value: Double = 0.0
    var body: some View {
        ZStack {
            Image("zen")
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
                        
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color("light"))
                    }
                        Spacer()
                    }
                    Text("1 minute meditation")
                        .font(.title)
                        .foregroundColor(Color("light"))
                    Spacer()
                    VStack(spacing: 10) {
                        Slider(value: $value, in: 0...60)
                            .accentColor(Color("light"))
                        HStack {
                            Text("0:00")
                            Spacer()
                            Text("1:00")
                        }
                        .font(.caption)
                        .foregroundColor(Color("light"))
                    }
                    HStack {
                        PlaybackButton(systemName: "repeat") {
                            
                        }
                        Spacer()
                        PlaybackButton(systemName: "gobackward.10") {
                            
                        }
                        Spacer()
                        PlaybackButton(systemName: "play.square.fill", fontSize: 50) {
                            
                        }
                        Spacer()
                        PlaybackButton(systemName: "goforward.10") {
                            
                        }
                        Spacer()
                        PlaybackButton(systemName: "stop.fill") {
                            
                        }
                    }
                }
                .padding()
            

        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
