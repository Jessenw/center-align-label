//
//  UserView.swift
//  center-align-label
//
//  Created by Jesse Williams on 4/04/22.
//

import UIKit

class CircleView: UIView {
    
    private static let circleSize = CGSize(width: 48, height: 48)
    
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
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.add
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Hello World!"
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
        addSubview(image)
        addSubview(label)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let imageSize = image.sizeThatFits(size)
        let labelSize = label.sizeThatFits(size)
        
        let maxWidth = max(imageSize.width, labelSize.width) + Self.horizontalPadding
        
        let maxHeight = max(imageSize.height, labelSize.height)
        
        // Find the view with the greatest width/height, but
        // restrict to available size
        return CGSize(
            width: min(maxWidth, size.width),
            height: min(maxHeight, size.height))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let availableSize = bounds.size
        
        let imageSize = image.sizeThatFits(availableSize)
        let labelSize = label.sizeThatFits(availableSize)
        
        image.frame = CGRect(
            origin: .zero,
            size: imageSize)
        
        let left = image.frame.maxX + Self.horizontalPadding
        
        label.frame = CGRect(
            origin: CGPoint(x: left, y: .zero),
            size: labelSize)
        
//        label.frame = image.frame.centerAlignY(
//            with: image.frame,
//            left: left,
//            font: <#T##UIFont?#>,
//            precomputedSize: labelSize)
    }
}
