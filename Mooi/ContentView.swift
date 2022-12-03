//
//  ContentView.swift
//  Mooi
//
//  Created by  Mr.Ki on 30.11.2022.
//5

import SwiftUI

struct ContentView: View {
    @ObservedObject var global = Global()
    var body: some View {
      //  ZenMeditationView(meditationVM: MeditationViewModel(meditation: Meditation.data))
        
        if global.onboardingOn {
            OnboardingManager()
        } else {
            GreedView()
        }
        
      //  GreedView()
       
       // MorphingCircle()
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
    }
}
