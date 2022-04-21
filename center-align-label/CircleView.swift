//
//  CircleView.swift
//  center-align-label
//
//  Created by Jesse Williams on 5/04/22.
//

import UIKit

class CircleView: UIView {
    
    private let circleSize: CGFloat = 48
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let shapeLayer = CALayer()
        shapeLayer.frame = CGRect(
            origin: .zero,
            size: CGSize(width: circleSize, height: circleSize))
        shapeLayer.cornerRadius = circleSize / 2
        shapeLayer.backgroundColor = UIColor.red.cgColor
        
        layer.addSublayer(shapeLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
