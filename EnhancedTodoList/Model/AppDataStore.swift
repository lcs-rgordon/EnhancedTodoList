//
//  AppDataStore.swift
//  EnhancedTodoList
//
//  Created by Russell Gordon on 2024-01-18.
//

import Foundation
import Observation

@Observable
class AppDataStore {
    
    // MARK: Stored properties
    var completedItemsCount: Int
    var items: [TodoItem]
    
    // MARK: Computed properties
    var incompleteItemsCount: Int {
        return items.count - completedItemsCount
    }

    // MARK: Initializers
    init(
        completedItemsCount: Int = 0,
        items: [TodoItem] = [],
        useTestData: Bool = false
    ) {
        self.completedItemsCount = completedItemsCount
        self.items = items
        
        if useTestData {
            self.items.append(contentsOf: exampleData)
        }
    }
    
}
