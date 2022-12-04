//
//  DataManager.swift
//  Mooi
//
//  Created by  Mr.Ki on 04.12.2022.
//

import Foundation
import CoreData

class DataManager: ObservableObject {
    let container = NSPersistentContainer(name: "Dat")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Load data error ❌ \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Saved ✅")
        } catch {
            print("Data not saved ❌")
        }
    }
    
    func addDate(context: NSManagedObjectContext) {
        
        let date = Item(context: context)
        date.date  = Date()
        
        save(context: context)
        
    }
}
