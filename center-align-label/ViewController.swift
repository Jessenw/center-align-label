//
//  ViewController.swift
//  center-align-label
//
//  Created by Jesse Williams on 3/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let userView = UserView(text: "Tim Cook")
    private let userViewAligned = UserView(text: "Syteve Jobs", useCorrectAlignment: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(userView)
        view.addSubview(userViewAligned)
    }
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let safeAreaBounds = view.bounds.inset(by: view.safeAreaInsets)
        let safeAreaBoundsSize = view.bounds.inset(
            by: view.safeAreaInsets).size

        let userViewSize = userView.sizeThatFits(safeAreaBoundsSize)
        let userViewAlignmentSize = userViewAligned.sizeThatFits(safeAreaBoundsSize)
        
        userView.frame = CGRect(
            origin: safeAreaBounds.origin,
            size: userViewSize)
        
        userViewAligned.frame = CGRect(
            origin: CGPoint(
                x: safeAreaBounds.origin.x,
                y: userView.frame.maxY + 16),
            size: userViewAlignmentSize)
    }
}
