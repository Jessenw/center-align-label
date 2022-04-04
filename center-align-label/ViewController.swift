//
//  ViewController.swift
//  center-align-label
//
//  Created by Jesse Williams on 3/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let userView = UserView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(userView)
    }
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let safeAreaBounds = view.bounds.inset(
            by: view.safeAreaInsets)

        let userViewSize = userView.sizeThatFits(safeAreaBounds.size)
        
        userView.frame = CGRect(
            origin: safeAreaBounds.origin,
            size: userViewSize)
    }
}
