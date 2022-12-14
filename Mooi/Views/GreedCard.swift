//
//  GreedCard.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import SwiftUI

struct GreedCard: View {
    var meditation: Meditation
    let imageSize: CGFloat = 180
    let scale: CGFloat = 1.0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                Image(meditation.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .clipped()
                    .saturation(0.5)
                    .scaleEffect(scale)
            }
            
            VStack(alignment: .leading) {
                Text(meditation.title)
                    .foregroundColor(Color("dark"))
                    .font(.headline)
                    .padding(.vertical, 10)
            }
            .padding(15)
            .frame(minWidth: 100, idealWidth: 180, maxWidth: 180, alignment: .leading)
            .background(Color("light").opacity(0.15))
            .background(.thickMaterial)
            .cornerRadius(25)
            .scaleEffect(scale)
        }
        .frame(minWidth: 100, idealWidth: 180, maxWidth: 180, minHeight: 200, idealHeight: 250, maxHeight: 250)
        .cornerRadius(25)
        
    }
}


struct GreedCard_Previews: PreviewProvider {
    static var previews: some View {
        GreedCard(meditation: Meditation.data)
    }
}
