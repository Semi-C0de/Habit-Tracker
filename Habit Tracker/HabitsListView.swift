//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 9/25/23.
//

import SwiftUI

struct HabitsListView: View {
    
//    @State private var activities:[Activity] = [
//        
//        Activity(name: "Drink Water", times: 0),
//        Activity(name: "Exercise", times: 6),
//        Activity(name: "Something Else", times: 0)
//    
//    ]
    
    @StateObject var activityDataController = DataController<Activity>(entityName: "Activity", containerName: "Habit_Tracker")

    
    var body: some View {
        Form {
            ForEach(activityDataController.savedEntities, id: \.id) {activity in
                
                ListItem(activityDataController: self.activityDataController, activity: activity)
            }
        }
        .navigationTitle("Habit Tracker")
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: HabitCircle(activityDataController: self.activityDataController)){
                    Image(systemName: "star.circle")
                }
            }
            
            ToolbarItem {
                Button {
                    withAnimation {
                        self.activityDataController.add({
                            $0.name = "test"
                            $0.times64 = 6
                            $0.id = UUID()
                        })
                    }
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        HabitsListView()
    }
}
