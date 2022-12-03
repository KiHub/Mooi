//
//  TopBar.swift
//  Mooi
//
//  Created by  Mr.Ki on 03.12.2022.
//

import SwiftUI

struct TopBar: View {
    let maxHeight = UIScreen.main.bounds.height / 6
    var array: [Meditation]
   
 //   @State private var searchText: String = ""
    
    var body: some View {
            GeometryReader { proxy in
                VStack(alignment: .leading, spacing: 15) {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                               HStack(spacing: 10) {
                                   
                                   ForEach(array) { data in
                                       NavigationLink {
                                           MeditationView(meditationVM: MeditationViewModel(meditation: data))
                                               .navigationBarHidden(true)
                                       } label: {
                                          GreedCardSquare(meditation: data)
                                       }
                                   }
                               }
                           }
                }
                .edgesIgnoringSafeArea(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .cornerRadius(30)
                .padding(.horizontal)
            }
            .frame(height: maxHeight)
    }
}
