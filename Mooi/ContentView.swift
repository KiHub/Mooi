//
//  ContentView.swift
//  Mooi
//
//  Created by  Mr.Ki on 30.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZenMeditationView(meditationVM: MeditationViewModel(meditation: Meditation.data))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
    }
}
