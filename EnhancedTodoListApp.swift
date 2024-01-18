//
//  EnhancedTodoListApp.swift
//  EnhancedTodoList
//
//  Created by Russell Gordon on 2024-01-18.
//

import SwiftData
import SwiftUI

@main
struct EnhancedTodoListApp: App {
    
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
