//
//  ListItem.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 9/30/23.
//

import SwiftUI

class Activity:ObservableObject {
    
    @Published var name:String
    @Published var times:Int
    
    let id:UUID
    
    init(name: String, times: Int) {
        self.name = name
        self.times = times
        
        self.id = UUID()
    }
    
    var color:Color {
        return self.times < 7 ? Color.habit[self.times] : Color.white
    }
    
    var textColor:Color {
        return self.times > 3 ? Color.white : Color.primary
    }
}

struct ListItem: View {
    
    @StateObject var activity:Activity
    
    var editedRating: Binding<Int> {
        Binding<Int>(
            get: {
                return self.activity.times
            },
            set: { newValue in
                
                self.activity.times = newValue
            })
    }
    
    var body: some View {
        
        HStack {
            Text(activity.name)
            
            Spacer()
            Stepper("\(activity.times)", value: editedRating, in: 0...6)
            
            
        }
        .onAppear{
            UIStepper.appearance().setDecrementImage(UIImage(systemName: "minus"), for: .normal)
            UIStepper.appearance().setIncrementImage(UIImage(systemName: "plus"), for: .normal)
        }
        .foregroundStyle(activity.textColor)
        .accentColor(activity.textColor)
        .listRowBackground(activity.color)
    }
}

#Preview {
    Form {
        ListItem(activity: Activity(name: "Activity 1", times: 0))
    }
}
