//
//  LabelledSwitchView.swift
//  center-align-label
//
//  Created by Jesse Williams on 10/04/22.
//

import UIKit

/// Setting a title on a UISwitch is only allowed
/// with a device idiom of .mac. So we need to create
/// our own
class LabelledSwitchView: UIView {
    
    private static let interItemPadding: CGFloat = 8
    
    private let labelView = UILabel()
    private let switchView = UISwitch()
    
    private let viewController: ViewController
    
    init(viewController: ViewController) {
        self.viewController = viewController
        
        super.init(frame: .zero)
        
        switchView.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        switchView.setOn(true, animated: false)
        labelView.text = "Toggle font attribute views"
        
        addSubview(labelView)
        addSubview(switchView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func switchChanged(mySwitch: UISwitch) {
        let isOn = mySwitch.isOn
        viewController.showFontAttributes = isOn
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let labelSize = labelView.sizeThatFits(size)
        let switchSize = switchView.sizeThatFits(size)
        
        let maxWidth = labelSize.width + switchSize.width + Self.interItemPadding
        let maxHeight = max(labelSize.height, switchSize.height)
        
        return CGSize(
            width: min(maxWidth, size.width),
            height: min(maxHeight, size.height))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let availableSize = bounds.size
    
        let labelSize = labelView.sizeThatFits(availableSize)
        let switchSize = switchView.sizeThatFits(availableSize)
        
        let maxHeight = max(labelSize.height, switchSize.height)
        
        switchView.frame = CGRect(
            origin: CGPoint(
                x: .zero,
                y: (maxHeight - switchSize.height) / 2),
            size: switchSize)
        
        labelView.frame.centerAlignY(
            with: switchView.frame,
            left: switchView.frame.maxX + Self.interItemPadding,
            font: labelView.font,
            precomputedSize: labelSize)
    }
}
