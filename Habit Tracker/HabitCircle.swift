//
//  HabitCircle.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 9/30/23.
//

import SwiftUI

struct HabitCircle: View {
    var body: some View {
        Circle()
            .frame(width: 200.0, height: 200.0)
            .foregroundStyle(LinearGradient(colors: [.red, .blue, .green, .yellow], startPoint: .bottomLeading, endPoint: .topTrailing))
            .overlay(Circle().stroke(lineWidth: 5))
    }
}

#Preview {
    HabitCircle()
}
