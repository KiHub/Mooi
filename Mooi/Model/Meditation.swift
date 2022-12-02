//
//  Meditation.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import Foundation

struct Meditation {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "1 minute meditation", description: "Close your eyes, clear your mind and breath slowly", duration: 70, track: "meditation1", image: "zen")
}
