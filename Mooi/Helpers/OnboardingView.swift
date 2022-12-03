//
//  OnboardingView.swift
//  Something space
//
//  Created by  Mr.Ki on 31.10.2022.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var global = Global()
    var data: OnboardingData
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Image(data.backgroundImage)
                    .resizable()
                    .scaledToFit()
                    .blur(radius: 10)
                    .saturation(0.90)

                Image(data.objectImage)
                    .resizable()
                    .scaledToFit()
                    .offset(x: 0, y: 180)
                    .scaleEffect(isAnimating ? 0.6 : 0.1)
            }

            Spacer()
            VStack(alignment: .center, spacing: 20) {
            Text(data.primaryText)
                .font(.title2)
                .bold()
                .foregroundColor(Color("dark"))
                .padding()

            Text(data.secondaryText)
                .font(.headline)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 250)
                .foregroundColor(Color("light"))
                .padding()
            }
            Spacer()
            Button(action: {
 
                global.onboardingOn = false

            }, label: {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color("dark")
                            )
                    )
            })
            .opacity(data.on ? 1.0 : 0.0)
            .shadow(radius: 10)

            Spacer()
        }
        .onAppear(perform: {
            isAnimating = false
            withAnimation(.easeOut(duration: 0.5)) {
                self.isAnimating = true
            }
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(data: OnboardingData.list.first!)
    }
}
