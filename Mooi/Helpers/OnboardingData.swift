//
//  OnboardingData.swift
//  Something space
//
//  Created by  Mr.Ki on 31.10.2022.
//

import Foundation

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let backgroundImage: String
    let objectImage: String
    let primaryText: String
    let secondaryText: String
    let on: Bool
    
    static let list: [OnboardingData] = [
        OnboardingData(id: 0, backgroundImage: "path", objectImage: "acorn1", primaryText: "Welcome to your Mooi meditation", secondaryText: "Here you can find the perfect music for meditation, work and chill", on: false),
        OnboardingData(id: 1, backgroundImage: "path", objectImage: "acorn1", primaryText: "What's your name?", secondaryText: "For easy meditation practice slowly breathe and follow the animated bubbles on the screen", on: true)
    ]
}
