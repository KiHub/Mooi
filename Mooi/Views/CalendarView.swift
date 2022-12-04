//
//  CalendarView.swift
//  Mooi
//
//  Created by  Mr.Ki on 04.12.2022.
//

import SwiftUI
import UIKit
import FSCalendar

struct CalendarView: View {
    
    @State var selectedDate: Date = Date()
    
    @Environment(\.managedObjectContext) var  managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var fetchedDates: FetchedResults<Item>
    
    var body: some View {
        CalendarViewRepresentable(selectedDate: $selectedDate, selectedDates: fetchedDates)
        
            .padding(.bottom)
            .padding(EdgeInsets(top: 40,
                                leading: 0, bottom: 0, trailing: 0))
        
    }
}

struct CalendarViewRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar
    fileprivate var calendar = FSCalendar()
    @Binding var selectedDate: Date
    var selectedDates: FetchedResults<Item>
    
    func makeUIView(context: Context) -> FSCalendar {
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        
        calendar.appearance.todayColor = .lightGray
        calendar.appearance.titleTodayColor = UIColor(named: "middle")
        calendar.appearance.selectionColor = .clear
        calendar.appearance.eventDefaultColor = UIColor(named: "dark")
        calendar.appearance.titleTodayColor = UIColor(named: "dark")
        calendar.appearance.titleFont = .boldSystemFont(ofSize: 24)
        calendar.appearance.titleWeekendColor = UIColor(named: "dark")
        calendar.appearance.headerMinimumDissolvedAlpha = 0.12
        calendar.appearance.headerTitleFont = .systemFont(
            ofSize: 20,
            weight: .regular)
        calendar.appearance.headerTitleColor = UIColor(named: "dark")
        calendar.appearance.headerDateFormat = "MMMM"
        calendar.scrollDirection = .vertical
        calendar.scope = .week
        calendar.locale = Locale(identifier: "en_US")
        calendar.appearance.weekdayTextColor = UIColor(named: "dark")
        
        calendar.tintColor =  UIColor(named: "dark")
        calendar.clipsToBounds = false
        
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject,
                       FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
        var parent: CalendarViewRepresentable
        
        init(_ parent: CalendarViewRepresentable) {
            self.parent = parent
        }
        
        func calendar(_ calendar: FSCalendar,
                      didSelect date: Date,
                      at monthPosition: FSCalendarMonthPosition) {
            
            parent.selectedDate = date
        }
        
        func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
            
            for eventDate in parent.selectedDates {
                if let ev = eventDate.date {
                    if ev.formatted(date: .complete,
                                    time: .omitted) == date.formatted(
                                        date: .complete, time: .omitted) {
                        return UIColor(named: "middle")
                    }
                }
            }
            return nil
        }
        
        func calendar(_ calendar: FSCalendar,
                      numberOfEventsFor date: Date) -> Int {
            var eventCount = 0
            parent.selectedDates.forEach { eventDate in
                if let ev = eventDate.date {
                    if ev.formatted(date: .complete,
                                    time: .omitted) == date.formatted(
                                        date: .complete, time: .omitted){
                        eventCount += 1;
                    }
                }
            }
            return eventCount
        }
        
        func maximumDate(for calendar: FSCalendar) -> Date {
            Date.now.addingTimeInterval(86400 * 30)
        }
        
        func minimumDate(for calendar: FSCalendar) -> Date {
            Date.now.addingTimeInterval(-86400 * 30)
        }
    }
}




