//
//  TodoItem.swift
//  EnhancedTodoList
//
//  Created by Russell Gordon on 2024-01-18.
//

import Foundation
import SwiftData

@Model
class TodoItem {
    
    var details: String
    let createdOn: Date
    var isCompleted: Bool
    var completedOn: Date?
    
    init(
        details: String,
        createdOn: Date = Date(),
        isCompleted: Bool = false,
        completedOn: Date? = nil
    ) {
        self.details = details
        self.createdOn = createdOn
        self.isCompleted = isCompleted
        self.completedOn = completedOn
    }

}

extension TodoItem {
    
    @MainActor  // Tells SwiftUI to run this code on the main thread
                // "mainContext" is a model context that runs on the main thread
                // Using @MainActor ensures this code in the "preview" property also
                // runs on the main thread.
                //
                // Code on one thread trying to interact with code on another thread is
                // a Very Bad Thing (leads to unpredictable results and hard to track
                // down bugs).
    static var preview: ModelContainer {
        
        // Create an in-memory only container to hold a list of items
        let container = try! ModelContainer(
            for: TodoItem.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
            
        // Add the test data to the list in this container
        container.mainContext.insert(TodoItem(details: "Go for a walk"))
        container.mainContext.insert(TodoItem(details: "Study for Physics"))
        container.mainContext.insert(TodoItem(details: "Call mom"))
        
        // Provide the container for use in previews
        return container
    }
}
