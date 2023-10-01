//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 9/25/23.
//

import SwiftUI

struct HabitsListView: View {
    
    @State private var activities:[Activity] = [
        
        Activity(name: "Drink Water", times: 0),
        Activity(name: "Exercise", times: 6),
        Activity(name: "Something Else", times: 0)
    
    ]
    
    var body: some View {
        Form {
            ForEach(self.activities, id: \.id) {activity in
                
                ListItem(activity: activity)
            }
        }
        .navigationTitle("Habit Tracker")
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: HabitCircle()){
                    Image(systemName: "star.circle")
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
