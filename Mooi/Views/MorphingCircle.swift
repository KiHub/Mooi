//
//  MorhingCircle.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import SwiftUI

struct MorphingCircle: View & Identifiable & Hashable {
    static func == (lhs: MorphingCircle, rhs: MorphingCircle) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id = UUID()
    @State var morph: AnimatableVector = AnimatableVector.zero
    @State var timer: Timer?
    
    func morphCreator() -> AnimatableVector {
        let range = Float(-morphingRange)...Float(morphingRange)
        var morphing = Array.init(repeating: Float.zero, count: self.points)
        for i in 0..<morphing.count where Int.random(in: 0...1) == 0 {
            morphing[i] = Float.random(in: range)
        }
        return AnimatableVector(values: morphing)
    }
    
    func update() {
        morph = morphCreator()
    }
    
    let duration: Double
    let points: Int
    let secting: Double
    let size: CGFloat
    let outerSize: CGFloat
    var color: Color
    let morphingRange: CGFloat
    var radius: CGFloat {
        outerSize / 2
    }
    
    var body: some View {
        ZStack {
        MorphingCircleShape(morph)
                .fill(Color("dark"))
                .opacity(0.5)
            .frame(width: size, height: size, alignment: .center)
            .animation(Animation.easeInOut(duration: Double(duration + 1.0)), value: morph)
            .onAppear {
                update()
                timer = Timer.scheduledTimer(withTimeInterval: duration / secting, repeats: true) { timer in
                    update()
                }
            }.onDisappear {
                timer?.invalidate()
            }
            .frame(width: outerSize, height: outerSize, alignment: .center)
            .animation(nil, value: morph)
            .offset(x: -50, y: -150)
            .scaleEffect(1.5)
            .blur(radius: 5)
            
            MorphingCircleShape(morph)
                .fill(Color("light"))
                .opacity(0.4)
                .frame(width: size/2, height: size, alignment: .center)
                .animation(Animation.easeInOut(duration: Double(duration + 1.0)), value: morph)
                .onAppear {
                    update()
                    timer = Timer.scheduledTimer(withTimeInterval: duration / secting, repeats: true) { timer in
                        update()
                    }
                }.onDisappear {
                    timer?.invalidate()
                }
                .frame(width: outerSize + 120, height: outerSize, alignment: .center)
                .animation(nil, value: morph)
                .offset(x: 50, y: 150)
                .blur(radius: 2)
            
            MorphingCircleShape(morph)
                    .fill(Color("middle"))
                    .opacity(0.3)
                .frame(width: size, height: size, alignment: .center)
                .animation(Animation.easeInOut(duration: Double(duration + 1.0)), value: morph)
                .onAppear {
                    update()
                    timer = Timer.scheduledTimer(withTimeInterval: duration / secting, repeats: true) { timer in
                        update()
                    }
                }.onDisappear {
                    timer?.invalidate()
                }
                .frame(width: outerSize, height: outerSize, alignment: .center)
                .animation(nil, value: morph)
                .offset(x: -120, y: 380)
                .scaleEffect(0.7)
                .blur(radius: 2)
            
            MorphingCircleShape(morph)
                    .fill(Color("middle"))
                    .opacity(0.4)
                .frame(width: size, height: size, alignment: .center)
                .animation(Animation.easeInOut(duration: Double(duration + 1.0)), value: morph)
                .onAppear {
                    update()
                    timer = Timer.scheduledTimer(withTimeInterval: duration / secting, repeats: true) { timer in
                        update()
                    }
                }.onDisappear {
                    timer?.invalidate()
                }
                .frame(width: outerSize, height: outerSize, alignment: .center)
                .animation(nil, value: morph)
                .offset(x: 160, y: -120)
                .scaleEffect(0.8)
                .blur(radius: 2)
            
            MorphingCircleShape(morph)
                    .fill(Color("light"))
                    .opacity(0.3)
                .frame(width: size, height: size, alignment: .center)
                .animation(Animation.easeInOut(duration: Double(duration + 1.0)), value: morph)
                .onAppear {
                    update()
                    timer = Timer.scheduledTimer(withTimeInterval: duration / secting, repeats: true) { timer in
                        update()
                    }
                }.onDisappear {
                    timer?.invalidate()
                }
                .frame(width: outerSize, height: outerSize, alignment: .center)
                .animation(nil, value: morph)
                .offset(x: -100, y: 0)
                .scaleEffect(0.3)
                .blur(radius: 2)
            
            MorphingCircleShape(morph)
                    .fill(Color("dark"))
                    .opacity(0.2)
                .frame(width: size, height: size, alignment: .center)
                .animation(Animation.easeInOut(duration: Double(duration + 1.0)), value: morph)
                .onAppear {
                    update()
                    timer = Timer.scheduledTimer(withTimeInterval: duration / secting, repeats: true) { timer in
                        update()
                    }
                }.onDisappear {
                    timer?.invalidate()
                }
                .frame(width: outerSize, height: outerSize, alignment: .center)
                .animation(nil, value: morph)
                .offset(x: 350, y: 550)
                .scaleEffect(0.4)
                .blur(radius: 2)
            
        }
    }
    
    init(_ size:CGFloat = 450, morphingRange: CGFloat = 50, color: Color = .orange, points: Int = 4,  duration: Double = 5.0, secting: Double = 2) {
        self.points = points
        self.color = color
        self.morphingRange = morphingRange
        self.duration = duration
        self.secting = secting
        self.size = morphingRange * 4 < size ? size - morphingRange * 4 : 10
        self.outerSize = size
        morph = AnimatableVector(values: [])
        update()
    }
    
}

struct MorphingCircle_Previews: PreviewProvider {
    static var previews: some View {
        MorphingCircle()
    }
}
