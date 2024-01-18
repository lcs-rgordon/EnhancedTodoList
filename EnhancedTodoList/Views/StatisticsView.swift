//
//  StatisticsView.swift
//  EnhancedTodoList
//
//  Created by Russell Gordon on 2024-01-18.
//

import Charts
import SwiftUI

struct StatisticsView: View {
    
    // MARK: Stored properties
    
    // Access the app data store
    @Environment(AppDataStore.self) var store

    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            Group {
                if store.items.count == 0 {
                    ContentUnavailableView(label: {
                        Label("No stats available", systemImage: "chart.pie.fill")
                            .foregroundStyle(.green)
                    }, description: {
                        Text("Statistics will appear once you have made and tracked some data.")
                    })
                } else {
                    VStack {
                        
                        HStack {
                            Text("Completion status")
                                .bold()
                            Spacer()
                        }
                        
                        Chart {
                            
                            if store.completedItemsCount > 0 {
                                SectorMark(
                                    angle: .value("Items Completed", store.completedItemsCount),
                                    innerRadius: .ratio(0.65),
                                    angularInset: 2.0
                                )
                                .foregroundStyle(.green)
                                .annotation(position: .overlay) {
                                    Text("\(store.completedItemsCount)")
                                        .foregroundStyle(.white)
                                }
                            }
                            
                            if store.incompleteItemsCount > 0 {
                                
                                SectorMark(
                                    angle: .value("Items Not Completed", store.incompleteItemsCount),
                                    innerRadius: .ratio(0.65),
                                    angularInset: 2.0
                                )
                                .foregroundStyle(.orange)
                                .annotation(position: .overlay) {
                                    Text("\(store.incompleteItemsCount)")
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        .chartBackground { proxy in
                            Text("📝")
                                .font(.system(size: 60))
                        }
                        .padding()
                        
                        HStack {
                            
                            Spacer()
                            
                            Circle()
                                .frame(width: 10)
                                .foregroundStyle(.orange)
                            
                            Text("No")
                                .font(.caption)

                            Spacer()
                            
                            Circle()
                                .frame(width: 10)
                                .foregroundStyle(.green)
                            
                            Text("Yes")
                                .font(.caption)
                            
                            Spacer()
                        }
                        
                        Rectangle()
                            .foregroundStyle(.clear)
                            .frame(height: 50)
                        
                    }
                    .padding()
                }
            }
            .navigationTitle("Statistics")
        }

    }
}

#Preview {
    LandingView(selectedTab: 2)
        .environment(AppDataStore(useTestData: true))
}

