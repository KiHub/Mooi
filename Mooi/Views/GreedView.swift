//
//  GreedView.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import SwiftUI

struct GreedView: View {
    var array = [Meditation.data, Meditation.data2, Meditation.data3]
    var colums = [GridItem(.adaptive(minimum: 120), spacing: 20)]
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: colums, spacing: 20) {
                            ForEach(array) { data in
                                NavigationLink {
                                    MeditationView(meditationVM: MeditationViewModel(meditation: data))
                                        .navigationBarHidden(true)
                                } label: {
                                    GreedCard(meditation: data)
                                }
                            }
                        }
                        .offset(x: 0, y: geometry.size.height * 0.25)
                        .padding()
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                    }
                    .background(Color("dark"))
                }
                
                HeaderView(title: "Hello, User1", subtitle: "Good day for meditation", bgColor: Color("light"))
            }
        }
    }
}

struct GreedView_Previews: PreviewProvider {
    static var previews: some View {
        GreedView()
    }
}
