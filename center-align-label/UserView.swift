//
//  UserView.swift
//  center-align-label
//
//  Created by Jesse Williams on 4/04/22.
//

import UIKit

class UserView: UIView {
    
    private static let horizontalPadding: CGFloat = 8
    
    private let circle = CircleView()
    private let label = UILabel()
    
    // MARK: - Debug views
    private var baselineView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private var xHeightView: UIView = {
        let view = UIView()
        view.backgroundColor = .magenta
        return view
    }()
    
    private var capHeightView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    private var ascenderView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private var descenderView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private var useCorrectAlignment = false
    
    init(text: String, useCorrectAlignment: Bool = false) {
        super.init(frame: .zero)
        
        label.text = text
        self.useCorrectAlignment = useCorrectAlignment
        
        commonInit()
    }
    
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
        
        addSubview(baselineView)
        addSubview(xHeightView)
        addSubview(capHeightView)
        addSubview(ascenderView)
        addSubview(descenderView)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let circleSize = CircleView.circleSize
        let labelSize = label.sizeThatFits(size)
        
        let maxWidth = circleSize.width + labelSize.width + Self.horizontalPadding
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
        
        print("Circle size: \(circleSize)")
        print("Label size: \(labelSize)")
        
        circle.frame = CGRect(
            origin: .zero,
            size: circleSize)
        
        let left = circle.frame.maxX + Self.horizontalPadding
        
        if useCorrectAlignment {
            label.frame = circle.frame.centerAlignY(
                with: circle.frame,
                left: left,
                font: label.font,
                precomputedSize: labelSize)
        } else {
            label.frame = CGRect(
                origin: CGPoint(
                    x: left,
                    y: (circleSize.height - labelSize.height) / 2),
                size: labelSize)
        }
        
        // Layout debug views
        if let font = label.font {
            let lineWidth: CGFloat = 1
            let lineSize = CGSize(
                width: availableSize.width,
                height: lineWidth)
            
            baselineView.frame = CGRect(
                origin: CGPoint(
                    x: .zero,
                    y: label.frame.maxY + font.descender),
                size: lineSize)
            
            xHeightView.frame = CGRect(
                origin: CGPoint(
                    x: .zero,
                    y: label.frame.maxY + font.descender - font.xHeight),
                size: lineSize)
            
            capHeightView.frame = CGRect(
                origin: CGPoint(
                    x: .zero,
                    y: label.frame.maxY + font.descender - font.capHeight),
                size: lineSize)
            
            ascenderView.frame = CGRect(
                origin: CGPoint(
                    x: .zero,
                    y: label.frame.maxY + font.descender - font.ascender),
                size: lineSize)
            
            descenderView.frame = CGRect(
                origin: CGPoint(
                    x: .zero,
                    y: label.frame.maxY),
                size: lineSize)

        }
    }
}
