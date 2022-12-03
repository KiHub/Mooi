//
//  MeditationView.swift
//  Mooi
//
//  Created by  Mr.Ki on 03.12.2022.
//

import SwiftUI

struct MeditationView: View {
    @StateObject var meditationVM: MeditationViewModel
    @State private var showPlayer = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Rectangle()
                .fill(LinearGradient(colors: [Color("dark"), .clear], startPoint: .bottom, endPoint: .top))
                .opacity(0.9)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                VStack {
                    Text(DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ?? meditationVM.meditation.duration.formatted() + "s")
                    
                }
                
                .font(.headline)
                .textCase(.lowercase)
                .opacity(0.8)
                
                Text(meditationVM.meditation.title)
                    .font(.title2)
                
                Text(meditationVM.meditation.description)
                    .frame(maxWidth: UIScreen.main.bounds.width / 2.3)
                HStack(alignment: .top, spacing: 20) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Back", systemImage: "backward.frame.fill")
                        
                            .font(.headline)
                            .foregroundColor(Color("dark"))
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .frame(maxWidth: UIScreen.main.bounds.width / 2.3)
                            .background(Color("light"))
                            .cornerRadius(20)
                    }
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Start", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(Color("dark"))
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .frame(maxWidth: UIScreen.main.bounds.width / 2.3)
                            .background(Color("light"))
                            .cornerRadius(20)
                    }
                    
                }
            }
            
        }
        .foregroundColor(Color("light"))
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(meditationVM: meditationVM)
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static let medidtaionVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        MeditationView(meditationVM: medidtaionVM)
            .environmentObject(AudioManager())
    }
}
