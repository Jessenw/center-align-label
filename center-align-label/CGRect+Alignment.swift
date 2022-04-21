//
//  CGRect+Alignment.swift
//  center-align-label
//
//  Created by Jesse Williams on 5/04/22.
//

import Foundation
import UIKit

extension CGRect {
    
    /// Horizontally center one rectangle with another. An optional font can be given
    /// If you want to center the text in the label rather than using the entire view
    /// - Parameters:
    ///   - rect: The UIRect to be aligned with
    ///   - left: The starting X position
    ///   - font: The font whose values will be used to center the rect
    ///   - precomputedSize: The pre-computed size of the view being aligned
    public mutating func centerAlignY(with rect: CGRect, left: CGFloat, font: UIFont, precomputedSize: CGSize = .zero) {
        
        var y: CGFloat = .zero
        
        // 1. Align the top of the fonts xHeight with the top of the view
        y -= font.lineHeight + font.descender - font.xHeight
        // 2. Center align with view using xHeight
        y += (rect.height - font.xHeight) / 2

        self.origin = CGPoint(x: left, y: y)
        self.size = precomputedSize
    }
}
