//
//  HeaderView.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import SwiftUI

struct HeaderView: View {
    let title: LocalizedStringKey
    let subtitle: LocalizedStringKey
    var bgColor: Color
    //   @Environment(\.dismiss) var dismiss
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Ellipse()
                    .fill(self.bgColor)
                    .frame(width: geometry.size.width * 1.4, height: geometry.size.height * 0.33)
                    .position(x: geometry.size.width / 2.35, y: geometry.size.height * 0.1)
                    .edgesIgnoringSafeArea(.all)
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text(self.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("dark"))
                        
                        Text(self.subtitle)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color("dark"))
                        HStack {
                            Image(systemName: "oval.portrait")
                                .foregroundColor(Color("dark"))
                            Image(systemName: "oval.portrait")
                                .foregroundColor(Color("dark"))
                            Image(systemName: "oval.portrait")
                                .foregroundColor(Color("dark"))
                        }
                        
                        
                        Spacer()
                    }
                    .padding(.leading, 25)
                    .padding(.top, 30)
                    Spacer()
                    
                    VStack() {
                        HStack() {
                            Button {
                                // to do
                            } label: {
                                Image(systemName: "line.3.horizontal")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color("dark"))
                            }
                            .padding(.trailing, 25)
                            .padding(.top, 30)
                        }
                        Spacer()
                    }
                    
                }
            }
        }
    }
}
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Hello, User", subtitle: "Let's start", bgColor: Color("light"))
    }
}
