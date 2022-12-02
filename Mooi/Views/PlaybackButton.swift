//
//  PlaybackButton.swift
//  Mooi
//
//  Created by  Mr.Ki on 01.12.2022.
//

import SwiftUI

struct PlaybackButton: View {
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = Color("light")
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }

    }
}

struct PlaybackButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackButton(action: {})
    }
}
