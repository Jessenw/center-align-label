//
//  ViewController.swift
//  center-align-label
//
//  Created by Jesse Williams on 3/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    private static let interItemPadding: CGFloat = 64
    
    private let userView = UserView(text: "Craig Federighi")
    private let userViewAligned = UserView(text: "Tim Cook", useCorrectAlignment: true)
    
    private lazy var toggleFontAttributeSwitch = LabelledSwitchView(viewController: self)
    public var showFontAttributes: Bool {
        get { true }
        set {
            userView.fontAttributeViewIsHidden = !newValue
            userViewAligned.fontAttributeViewIsHidden = !newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(userView)
        view.addSubview(userViewAligned)
        
        view.addSubview(toggleFontAttributeSwitch)
    }
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let safeAreaBounds = view.bounds.inset(by: view.safeAreaInsets)
        let safeAreaBoundsSize = view.bounds.inset(
            by: view.safeAreaInsets).size
        
        // Layout button
        let fontAttributeSwitchSize = toggleFontAttributeSwitch.sizeThatFits(safeAreaBoundsSize)
        toggleFontAttributeSwitch.frame = CGRect(
            origin: safeAreaBounds.origin,
            size: fontAttributeSwitchSize)
        
        toggleFontAttributeSwitch.frame.origin.x += 8
        toggleFontAttributeSwitch.frame.origin.y += 8
        
        // Layout user views
        let userViewSize = userView.sizeThatFits(safeAreaBoundsSize)
        let userViewAlignedSize = userViewAligned.sizeThatFits(safeAreaBoundsSize)
        
        userView.frame = CGRect(
            origin: CGPoint(
                x: (safeAreaBounds.size.width - userViewSize.width) / 2,
                y: (safeAreaBounds.size.height - userViewSize.height) / 2),
            size: userViewSize)
        
        userViewAligned.frame = CGRect(
            origin: CGPoint(
                x: userView.frame.minX, // Align with first view
                y: (safeAreaBounds.size.height - userViewAlignedSize.height) / 2 + Self.interItemPadding),
            size: userViewAlignedSize)
    }
}
