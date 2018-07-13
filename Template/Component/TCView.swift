//
//  TCView.swift
//  Template
//
//  Created by David Yu on 2018/7/12.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

struct TCView: Template {

    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var status: Status
    
    let color: UIColor
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        status = .normal

        self.color = color
    }

    mutating func calculate() {
    }
    
    mutating func setup(view: UIView) {
        let myView = UIView(frame: frame)
        myView.backgroundColor = color
        view.addSubview(myView)
    }
}
