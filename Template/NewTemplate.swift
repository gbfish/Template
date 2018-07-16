//
//  NewTemplate.swift
//  Template
//
//  Created by David Yu on 2018/7/16.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

protocol TemplateSizeable {
    var x: CGFloat { get set }
    var y: CGFloat { get set }
    var width: CGFloat { get set }
    var height: CGFloat { get set }
    
    var status: TemplateSizeableStatus { get set }
        
    mutating func calculate()
}

enum TemplateSizeableStatus {
    case normal
    case needCalculate
}

extension TemplateSizeable {
    mutating func calculate() {
        status = .normal
    }
    
    mutating func calculateIfNeed() {
        if status == .needCalculate {
            calculate()
        }
    }
    
    var cuttentFrame: CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    
    
//    mutating func size() -> CGRect {
//        if status == .needCalculate {
//            calculate()
//        }
//        return CGRect(x: x, y: y, width: width, height: height)
//    }
//    
//    mutating func change(width: CGFloat) {
//        self.width = width
//        status = .needCalculate
//    }
}
