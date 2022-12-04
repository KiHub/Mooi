//
//  Extensions.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import Foundation
import SwiftUI

extension DateComponentsFormatter {
    static let abbreviated: DateComponentsFormatter = {
        print("DateComponentsFormatter abbreviated")
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
    
    static let positional: DateComponentsFormatter = {
        print("DateComponentsFormatter positional")
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
}

extension CGPoint {
    public static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func +(lhs: CGPoint, rhs: CGVector) -> CGPoint {
        CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
    }
    
    static func -(lhs: CGPoint, rhs: CGVector) -> CGPoint {
        CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
    }
    
    public static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    init(_ vec: CGVector) {
        self = CGPoint(x: vec.dx, y: vec.dy)
    }
}

extension CGPoint: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        x = CGFloat(rhs) * x
        y = CGFloat(rhs) * y
    }
    
    public var magnitudeSquared: Double {
        Double(x * x + y * y)
    }
    

}

extension CGVector {
    init(_ point: CGPoint) {
        self = CGVector(dx: point.x, dy: point.y)
    }
    
    func scalar(_ vec: CGVector) -> CGFloat {
        dx * vec.dx + dy * vec.dy
    }
    
    func len() -> CGFloat {
        sqrt(dx * dx + dy * dy)
    }
    
    func perpendicular() -> CGVector {
        CGVector(dx: -dy, dy: dx) / len()
    }
    
    static func *(lhs: CGVector, rhs: CGFloat) -> CGVector {
        CGVector(dx: lhs.dx * rhs, dy: lhs.dy * rhs)
    }
    
    static func *(lhs: CGFloat, rhs: CGVector) -> CGVector {
        CGVector(dx: rhs.dx * lhs, dy: rhs.dy * lhs)
    }
    
    static func /(lhs: CGVector, rhs: CGFloat) -> CGVector {
        CGVector(dx: lhs.dx / rhs, dy: lhs.dy / rhs)
    }
    
    static func -(lhs: CGVector, rhs: CGVector) -> CGVector {
        CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy - rhs.dy)
    }
    
    static func +(lhs: CGVector, rhs: CGVector) -> CGVector {
        CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
    }
    
    func angle(_ rhs: CGVector) -> CGFloat {
        return acos(scalar(rhs) / (rhs.len() * len()))
    }
}




//extension Date: RawRepresentable {
//    private static let formatter = ISO8601DateFormatter()
//    
//    public var rawValue: String {
//        Date.formatter.string(from: self)
//    }
//    
//    public init?(rawValue: String) {
//        self = Date.formatter.date(from: rawValue) ?? Date()
//    }
//}
