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
    @ObservedObject var global = Global()
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                NavigationView {
                   
                    ScrollView {
                        VStack(spacing: geometry.size.height * 0.05) {
                        TopBar(array: array)
                            .foregroundColor(Color("light"))
                        LazyVGrid(columns: colums, spacing: geometry.size.height * 0.07) {
                            ForEach(array) { data in
                                NavigationLink {
                                    MeditationView(meditationVM: MeditationViewModel(meditation: data))
                                        .navigationBarHidden(true)
                                } label: {
                                    GreedCard(meditation: data)
                                }
                            }
                        }
                        .padding()
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        }
                        .offset(x: 0, y: geometry.size.height * 0.25)
                    }
                    .background(Color("dark"))
                }
                
                HeaderView(title: "Hello, \(global.userName)", subtitle: "Good day for meditation, isn't it?", bgColor: Color("light"))
            }
        }
    }
}

struct GreedView_Previews: PreviewProvider {
    static var previews: some View {
        GreedView()
    }
}
