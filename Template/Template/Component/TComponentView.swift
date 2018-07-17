//
//  TComponentView.swift
//  Template
//
//  Created by David Yu on 2018/7/13.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

struct TComponentView: TComponent {
    let color: UIColor
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        status = .needCalculate
        
        self.color = color
    }
    
    // MARK: - TComponent
    
    typealias ComponentType = UIView
    
    var component: UIView {
        let view = UIView(frame: currentFrame)
        view.backgroundColor = color
        return view
    }
    
    // MARK: - TemplateSizeable
    
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var status: TemplateSizeableStatus
}
