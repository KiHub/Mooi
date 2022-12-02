//
//  ViewModel.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}

