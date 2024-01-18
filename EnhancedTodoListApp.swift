//
//  EnhancedTodoListApp.swift
//  EnhancedTodoList
//
//  Created by Russell Gordon on 2024-01-18.
//

import SwiftUI

@main
struct EnhancedTodoListApp: App {
    
    // MARK: Stored properties
    
    // Create single source of truth for all data used in app
    @State var store = AppDataStore()
    
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
        .environment(store)
    }
}
