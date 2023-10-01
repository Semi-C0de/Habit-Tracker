//
//  ListItem.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 9/30/23.
//

import SwiftUI

struct ListItem: View {
    
    @ObservedObject var activityDataController:DataController<Activity>
    @ObservedObject var activity:Activity
    
    var editedRating: Binding<Int> {
        Binding<Int>(
            get: {
                return activity.times
            },
            set: { newValue in
                
                activityDataController.update(obj: self.activity, {
                    $0.times64 = Int64(newValue)
                })
                
            })
    }
    
    var body: some View {
        
        HStack {
            Text(activity.displayName)
            
            Spacer()
            Stepper("\(activity.times)", value: editedRating, in: 0...6)
            
            
        }
        .onAppear{
            UIStepper.appearance().setDecrementImage(UIImage(systemName: "minus"), for: .normal)
            UIStepper.appearance().setIncrementImage(UIImage(systemName: "plus"), for: .normal)
        }
        .listRowBackground(self.activity.bgColor)
        .tint(activity.txColor)
        .foregroundStyle(activity.txColor)
    }
}
