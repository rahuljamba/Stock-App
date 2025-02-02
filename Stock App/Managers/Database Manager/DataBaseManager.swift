//
//  DataManager.swift
//  Stock App
//
//  Created by Apple on 02/02/25.
//
import SwiftUI
import SwiftData

class DataBaseManager {
    
    private let modelContainer: ModelContainer

    init<T: PersistentModel>(modelType: T.Type) {
        do {
            modelContainer = try ModelContainer(for: modelType)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    // Insert Data
    @MainActor func addItem<T: PersistentModel>(item: T) {
        
        modelContainer.mainContext.insert(item)
        saveContext()
        
    }

    // Fetch Data
    @MainActor func getItems<T: PersistentModel>(sortBy sortDescriptors: [SortDescriptor<T>] = []) -> [T] {
        let descriptor = FetchDescriptor<T>(sortBy: sortDescriptors)
        do {
            return try modelContainer.mainContext.fetch(descriptor)
        } catch {
            print("Error fetching items: \(error)")
            return []
        }
    }

    // Delete Data
    @MainActor func deleteItems<T: PersistentModel>(items: [T]) {
        withAnimation {
            for item in items {
                modelContainer.mainContext.delete(item)
            }
            saveContext()
        }
    }

    @MainActor private func saveContext() {
        if modelContainer.mainContext.hasChanges {
            do {
                try modelContainer.mainContext.save()
            } catch {
                let nsError = error as NSError
                print("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}
