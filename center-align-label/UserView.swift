//
//  UserView.swift
//  center-align-label
//
//  Created by Jesse Williams on 4/04/22.
//

import UIKit

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
        
        // Find the view with the greatest width/height, but
        // restrict to available size
        return CGSize(
            width: min(max(imageSize.width, labelSize.width), size.width),
            height: min(max(imageSize.height, labelSize.height), size.height))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let availableSize = bounds.size
        
        var left: CGFloat = Self.horizontalPadding
        
        let imageSize = image.sizeThatFits(availableSize)
        let labelSize = label.sizeThatFits(availableSize)
        
        image.frame = CGRect(
            origin: CGPoint(
                x: left,
                y: .zero),
            size: imageSize)
        
        left += image.frame.maxX + Self.horizontalPadding
        
        label.frame = CGRect(
            origin: CGPoint(
                x: left,
                y: .zero),
            size: labelSize)
    }
}
