//
//  UserView.swift
//  center-align-label
//
//  Created by Jesse Williams on 4/04/22.
//

import UIKit

class CircleView: UIView {
    
    public static let circleSize = CGSize(width: 24, height: 24)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        let circlePath = UIBezierPath(
            ovalIn: CGRect(
                origin: .zero,
                size: Self.circleSize))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        
        layer.addSublayer(shapeLayer)
    }
}

class UserView: UIView {
    
    private static let horizontalPadding: CGFloat = 8
    
    private let circle = CircleView()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Tim Cook"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }
    
    private func commonInit() {
        addSubview(circle)
        addSubview(label)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let circleSize = circle.sizeThatFits(size)
        let labelSize = label.sizeThatFits(size)
        
        let maxWidth = max(circleSize.width, labelSize.width) + Self.horizontalPadding
        
        let maxHeight = max(circleSize.height, labelSize.height)
        
        // Find the view with the greatest width/height, but
        // restrict to available size
        return CGSize(
            width: min(maxWidth, size.width),
            height: min(maxHeight, size.height))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let availableSize = bounds.size
        
        let circleSize = CircleView.circleSize
        let labelSize = label.sizeThatFits(availableSize)
        
        circle.frame = CGRect(
            origin: .zero,
            size: circleSize)
        
        let left = circle.frame.maxX + Self.horizontalPadding
        
        label.frame = CGRect(
            origin: CGPoint(
                x: left,
                y: (circleSize.height - labelSize.height) / 2),
            size: labelSize)
        
//        label.frame = image.frame.centerAlignY(
//            with: image.frame,
//            left: left,
//            font: <#T##UIFont?#>,
//            precomputedSize: labelSize)
    }
}
