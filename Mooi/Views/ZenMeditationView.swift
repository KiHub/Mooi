//
//  ZenMeditationView.swift
//  Mooi
//
//  Created by  Mr.Ki on 30.11.2022.
//

import SwiftUI

struct ZenMeditationView: View {
    @StateObject var meditationVM: MeditationViewModel
    @State private var showPlayer = false
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image(meditationVM.meditation.image)
                    .resizable()
                    .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
                Rectangle()
                    .fill(LinearGradient(colors: [Color("dark"), .clear], startPoint: .bottom, endPoint: .top))
                   .opacity(0.9)
            }
            ZStack {
                Color("dark")
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Music")
                        Text(DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ?? meditationVM.meditation.duration.formatted() + "s")
                    }
                    .font(.headline)
                    .textCase(.lowercase)
                    .opacity(0.8)
                    Text(meditationVM.meditation.title)
                        .font(.title2)
                    
                    Text(meditationVM.meditation.description)
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Start", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(Color("dark"))
                            .padding(.horizontal)
                            .padding(.vertical, 8)
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
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(meditationVM: meditationVM)
        }
    }
}

struct ZenMeditationView_Previews: PreviewProvider {
    static let medidtaionVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        ZenMeditationView(meditationVM: medidtaionVM)
            .environmentObject(AudioManager())
    }
}
