//
//  Meditation.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import Foundation

struct Meditation: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "1 minute meditation", description: "Close your eyes, clear your mind and breath slowly", duration: 70, track: "meditation1", image: "zen")
    static let data2 = Meditation(title: "2 minutes meditation", description: "Close your eyes, clear your mind and breath slowly", duration: 70, track: "meditation1", image: "zen")
    static let data3 = Meditation(title: "3 minutes meditation", description: "Close your eyes, clear your mind and breath slowly", duration: 70, track: "meditation1", image: "zen")
//    static let allData = [data, data, data, data]
    
}
