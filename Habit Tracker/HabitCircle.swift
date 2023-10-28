//
//  HabitCircle.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 9/30/23.
//

import SwiftUI
import UIKit
    
    struct HabitCircle: View {
        
        @ObservedObject var activityDataController:DataController<Activity>
        
        var body: some View {
            Circle()
                .frame(width: 200.0, height: 200.0)
                .foregroundStyle(Color(blendColors()))
                .overlay(Circle().stroke(lineWidth: 5))
            
        }
        
        func blendColors() -> UIColor {
            var c:[UIColor] = []
            for activity in self.activityDataController.savedEntities {
                c.append(UIColor(Color.habit[activity.times]))
            }
            
            var intensities:[CGFloat] = []
            for _ in c {
                intensities.append(CGFloat(1.0/Double(c.count)))
            }
            
            return UIColor.blend(colors: c, intensities: intensities)
        }
    }
