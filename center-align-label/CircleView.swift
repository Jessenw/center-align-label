//
//  CircleView.swift
//  center-align-label
//
//  Created by Jesse Williams on 5/04/22.
//

import UIKit

class CircleView: UIView {
    
    public static let circleSize = CGSize(width: 48, height: 48)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let circlePath = UIBezierPath(
            ovalIn: CGRect(
                origin: .zero,
                size: Self.circleSize))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        
        layer.addSublayer(shapeLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
