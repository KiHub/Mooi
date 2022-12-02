//
//  GreedView.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import SwiftUI

struct GreedView: View {
    var array = [Meditation.data, Meditation.data2, Meditation.data3]
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 15)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: colums, spacing: 20) {
                    ForEach(array) { data in
                        NavigationLink {
                            ZenMeditationView(meditationVM: MeditationViewModel(meditation: data))
                                .navigationBarHidden(true)
                        } label: {
                            GreedCard(meditation: data)
                        }
                    }
                }
                .padding()
                .navigationBarHidden(true)
                .navigationTitle(" ")
                .navigationBarBackButtonHidden(true)
            }
            .background(Color("dark"))
        }
    }
}

struct GreedView_Previews: PreviewProvider {
    static var previews: some View {
        GreedView()
    }
}
