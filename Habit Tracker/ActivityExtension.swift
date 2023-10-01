//
//  ActivityExtension.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 9/30/23.
//

import Foundation
import SwiftUI

extension Activity {
    
    var bgColor:Color {
    
        return self.times < 7 ? Color.habit[self.times] : Color.white
        
    }
    
    var txColor:Color {
        return self.times > 3 ? Color.white : Color.black
    }
    
    var displayName:String {
        self.name ?? "NA"
    }
    
    var times:Int {
        Int(self.times64)
    }
}
