//
//  ZenMeditationView.swift
//  Mooi
//
//  Created by  Mr.Ki on 30.11.2022.
//

import SwiftUI

struct ZenMeditationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("zen")
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            ZStack {
                Color("dark")
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Music")
                        Text("0s")
                    }
                    .font(.headline)
                    .textCase(.lowercase)
                    .opacity(0.8)
                    Text("1 minute meditation")
                        .font(.title2)
                    
                    Text("Close your eyes, clear your mind and breath slowly")
                    Button {
                        
                    } label: {
                        Label("Start", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(Color("dark"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("light"))
                            .cornerRadius(20)
                    }

                    
                    Spacer()
                }
                .foregroundColor(Color("light"))
                .padding(20)
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
    }
}

struct ZenMeditationView_Previews: PreviewProvider {
    static var previews: some View {
        ZenMeditationView()
    }
}
