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
    /// - Returns: UIRect which aligns with the provided rectangle
    public func centerAlignY(with rect: CGRect, left: CGFloat, font: UIFont?, precomputedSize: CGSize = .zero) -> CGRect {
        
        let y: CGFloat
        
        // If a font is provided to align text, align using the xHeight
        if let font = font {
            // Align the top of the font with the top of the view
            let topPaddingOffset = font.lineHeight + font.descender - font.xHeight
            // Center align with view
            let centerAlignOffset = (rect.height - font.xHeight) / 2

            y = rect.minY - topPaddingOffset + centerAlignOffset
        } else {
            y = ((rect.height - self.height) / 2) + rect.minY
        }

        return CGRect(
            origin: CGPoint(x: left, y: y),
            size: precomputedSize)
    }
}
