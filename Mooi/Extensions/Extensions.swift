//
//  Extensions.swift
//  Mooi
//
//  Created by  Mr.Ki on 02.12.2022.
//

import Foundation

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
