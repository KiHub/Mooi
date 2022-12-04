//
//  CalendarView.swift
//  Mooi
//
//  Created by  Mr.Ki on 04.12.2022.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    var tomorrow = Date.now.addingTimeInterval(86400)
    @State private var dates: Set<DateComponents> = []
    var body: some View {
       
        
        VStack {
            
            
//            MultiDatePicker("Dates Available", selection: $dates)
//                      .fixedSize()
            
            DatePicker(
                    "Start Date",
                    selection:  $date,
                    displayedComponents: [.date]
                )
            .datePickerStyle(.graphical)
    
            .accentColor(Color("dark"))
        }
            
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
