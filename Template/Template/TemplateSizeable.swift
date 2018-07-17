//
//  TemplateSizeable.swift
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
//    class func calculate()

}

enum TemplateSizeableStatus {
    case normal
    case needCalculate
}

extension TemplateSizeable {
    mutating func calculate() {
    }
    
    mutating func calculateIfNeeded() {
        if status == .needCalculate {
            calculate()
            status = .normal
        }
    }
    
    var currentFrame: CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
}

extension TemplateSizeable where Self: AnyObject {
    func calculate() {
    }
    
    mutating func calculateIfNeeded() {
        if status == .needCalculate {
            calculate()
            status = .normal
        }
    }
}
