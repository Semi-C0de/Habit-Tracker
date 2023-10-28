//
//  UIColorExtension.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 10/27/23.
//

import Foundation
import UIKit

extension UIColor {
    static func blend(colors: [UIColor], intensities: [CGFloat]) -> UIColor {
        guard colors.count == intensities.count, !colors.isEmpty else {
            // Handle invalid input, e.g., when the arrays have different lengths or are empty
            return .black
        }
        
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        
        for (color, intensity) in zip(colors, intensities) {
            guard intensity > 0 else { continue }
            
            var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
            
            r += intensity * r2
            g += intensity * g2
            b += intensity * b2
            a += intensity * a2
        }
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
