//
//  GreedCardSquare.swift
//  Mooi
//
//  Created by  Mr.Ki on 03.12.2022.
//

import SwiftUI

struct GreedCardSquare: View {
    var meditation: Meditation
    let imageSize: CGFloat = 180
    let scale: CGFloat = 1.0
    
    var body: some View {
        ZStack() {
                Image(meditation.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .clipped()
                    .saturation(0.5)
                    .scaleEffect(scale)
             
                VStack(alignment: .leading) {
                    Text(meditation.title)
                                       .foregroundColor(Color("dark"))
                                       .font(.footnote)
                                       .padding(10)
                                       .frame(minWidth: 100, maxWidth: 135, alignment: .leading)

                }
                .background(.thinMaterial)
                            .cornerRadius(10)
                            .offset(x: 0, y: 35)
        }
        .frame(width: 150, height: 150)
        .cornerRadius(25)
        
    }
}

struct GreedCardSquare_Previews: PreviewProvider {
    static var previews: some View {
        GreedCardSquare(meditation: Meditation.data)
    }
}
