//
//  UserView.swift
//  center-align-label
//
//  Created by Jesse Williams on 4/04/22.
//

import UIKit

class UserView: UIView {
    
    private static let horizontalPadding: CGFloat = 8
    
    public var fontAttributeViewIsHidden: Bool {
        get { baselineView.isHidden }
        set {
            baselineView.isHidden = newValue
            xHeightView.isHidden = newValue
            capHeightView.isHidden = newValue
            ascenderView.isHidden = newValue
            descenderView.isHidden = newValue
        }
    }
    
    private let circleView = CircleView()
    private let labelView = UILabel()
    
    // MARK: - Font attribute views
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
    
    private var useXHeightAlignment = false
    
    init(text: String, useXHeightAlignment: Bool = false) {
        super.init(frame: .zero)
        
        labelView.text = text
        self.useXHeightAlignment = useXHeightAlignment
        
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
        labelView.font = labelView.font.withSize(36)
        
        addSubview(circleView)
        addSubview(labelView)
        addSubview(baselineView)
        addSubview(xHeightView)
        addSubview(capHeightView)
        addSubview(ascenderView)
        addSubview(descenderView)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let circleSize = circleView.circleSize
        let labelSize = labelView.sizeThatFits(size)
        
        let maxWidth = circleSize + labelSize.width + Self.horizontalPadding
        let maxHeight = max(circleSize, labelSize.height)
        
        // Find the view with the greatest width/height, but
        // restrict to available size
        return CGSize(
            width: min(maxWidth, size.width),
            height: min(maxHeight, size.height))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let availableSize = bounds.size
        
        let circleSize = circleView.circleSize
        let labelSize = labelView.sizeThatFits(availableSize)
        
        circleView.frame = CGRect(
            origin: .zero,
            size: CGSize(width: circleSize, height: circleSize))
        
        let left = circleView.frame.maxX + Self.horizontalPadding
        
        if useXHeightAlignment {
            labelView.frame = circleView.frame.centerAlignY(
                with: circleView.frame,
                left: left,
                font: labelView.font,
                precomputedSize: labelSize)
        } else {
            labelView.frame = CGRect(
                origin: CGPoint(
                    x: left,
                    y: (circleSize - labelSize.height) / 2),
                size: labelSize)
        }
        
        // Layout debug views
        if let font = labelView.font {
            let lineWidth: CGFloat = 1
            
            let lineSize = CGSize(
                width: availableSize.width,
                height: lineWidth)
            
            baselineView.frame = CGRect(
                origin: CGPoint(
                    x: .zero,
                    y: labelView.frame.maxY + font.descender),
                size: lineSize)
            
            xHeightView.frame = CGRect(
                origin: CGPoint(
                    x: .zero,
                    y: labelView.frame.maxY + font.descender - font.xHeight),
                size: lineSize)
            
            capHeightView.frame = CGRect(
                origin: CGPoint(
                    x: .zero,
                    y: labelView.frame.maxY + font.descender - font.capHeight),
                size: lineSize)
            
            ascenderView.frame = CGRect(
                origin: CGPoint(
                    x: .zero,
                    y: labelView.frame.maxY + font.descender - font.ascender),
                size: lineSize)
            
            descenderView.frame = CGRect(
                origin: CGPoint(
                    x: .zero,
                    y: labelView.frame.maxY),
                size: lineSize)

        }
    }
}
