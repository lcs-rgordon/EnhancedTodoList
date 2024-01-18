//
//  TodoListView.swift
//  EnhancedTodoList
//
//  Created by Russell Gordon on 2024-01-18.
//

import SwiftUI

struct TodoListView: View {
    
    // MARK: Stored properties
    
    // The item currently being created
    @State private var newItemDetails = ""
    
    // Access the app data store
    @Environment(AppDataStore.self) var store
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack {
                                    
                    TextField("Enter a to-do item", text: $newItemDetails)
                    
                    Button("Add") {
                        addItem()
                    }
                    
                }
                .padding(20)
                
                if store.items.isEmpty {
                    
                    ContentUnavailableView(label: {
                        Label(
                            "Nothing to do",
                            systemImage: "powersleep"
                        )
                        .foregroundStyle(.green)
                    }, description: {
                        Text("To-do items will appear here once you add some.")
                    })
                    
                } else {
                    
                    List(store.items) { currentItem in
                        Label {
                            Text(currentItem.details)
                        } icon: {
                            Image(systemName: currentItem.isCompleted ? "checkmark.circle" : "circle")
                                .onTapGesture {
                                    toggle(item: currentItem)
                                }
                        }
                    }
                    
                }
            }
            .navigationTitle("Tasks")
        }
        
    }
    
    // MARK: Functions
    func addItem() {
        let newToDoItem = TodoItem(details: newItemDetails)
        store.items.append(newToDoItem)
        newItemDetails = ""
    }
    
    func toggle(item: TodoItem) {
        if item.isCompleted {
            item.completedOn = nil
            item.isCompleted = false
        } else {
            item.completedOn = Date()
            item.isCompleted = true
        }
        
    }
}

#Preview {
    LandingView()
        .environment(AppDataStore(useTestData: true))
}
