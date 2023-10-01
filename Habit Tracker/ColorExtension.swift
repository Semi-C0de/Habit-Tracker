//
//  ColorExtension.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 9/27/23.
//

import Foundation
import SwiftUI

extension Color {
    
    public init(red: Int, green: Int, blue: Int) {
        self.init(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0, opacity: 1.0)
    }

    static let habit:[Color] = [
        Color(red: 147, green: 205, blue: 155),
        Color(red: 112, green: 190, blue: 133),
        Color(red: 41, green: 167, blue: 92),
        Color(red: 0, green: 154, blue: 72),
        Color(red: 0, green: 135, blue: 52),
        Color(red: 0, green: 119, blue: 49),
        Color(red: 20, green: 92, blue: 40)
    ]
}
