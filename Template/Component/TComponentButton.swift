//
//  TCButton.swift
//  Template
//
//  Created by David Yu on 2018/7/13.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

struct TComponentButton: TComponent {
    typealias ComponentType = UIButton
    
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var status: Status
    
    var action: () -> ()
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, action: @escaping () -> ()) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        status = .normal
        
        self.action = action
    }
    
    var component: UIButton {
        let button = TComponentButtonUI(frame: frame, action: action)
//        button.backgroundColor = UIColor.brown
        button.addTarget(button, action: #selector(button.pressButton(_:)), for: .touchUpInside)
        return button
    }
}

class TComponentButtonUI: UIButton {
    init(frame: CGRect, action: @escaping () -> ()) {
        self.action = action
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let action: () -> ()
    
    @objc func pressButton(_ sender: UIButton) {
        action()
    }
}
