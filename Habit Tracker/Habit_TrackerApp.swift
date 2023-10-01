//
//  Habit_TrackerApp.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 9/25/23.
//

import SwiftUI

@main
struct Habit_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HabitsListView()
            }
        }
    }
}
