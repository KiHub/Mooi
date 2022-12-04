//
//  MooiApp.swift
//  Mooi
//
//  Created by  Mr.Ki on 30.11.2022.
//

import SwiftUI

@main
struct MooiApp: App {
    @StateObject private var dataManager = DataManager()
    @StateObject var audioManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
                .environment(\.managedObjectContext, dataManager.container.viewContext)
        }
    }
}
