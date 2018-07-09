//
//  Template.swift
//  Template
//
//  Created by David Yu on 2018/7/9.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import Foundation
import UIKit

enum Status {
    case normal
    case needCalculate
}

protocol Changeable {
    var x: CGFloat { get set }
    var y: CGFloat { get set }
    var width: CGFloat { get set }
    var height: CGFloat { get set }
    
    var status: Status { get set }
    
    var items: [Changeable]? { get set }
    
    mutating func calculate()
    
    mutating func setup(view: UIView) 
}

extension Changeable {
    mutating func size() -> CGRect {
        if status == .needCalculate {
            calculate()
        }
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    mutating func change(width: CGFloat) {
        self.width = width
        status = .needCalculate
    }
    /*
    func calculateMyself() {
        if status == .needCalculate {
            itemsArray = [Changeable]()
            
            let item1 = TemplateLarge(x: 10.0, y: 10.0, width: 50.0, height: 0.0, status: .needCalculate, itemsArray: nil)
            
            itemsArray?.append(item1)
            
            
            
            if let itemsArray = itemsArray {
                for item in itemsArray {
                    
                }
            }
            
            
            height = 200.0
            status = .normal
        }
    }*/
    
//    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
//        self.x = x
//        self.y = y
//        self.width = width
//        self.height = height
//        
//        status = .needCalculate
//    }
//    
//    mutating func setup(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
//        self.x = x
//        self.y = y
//        self.width = width
//        self.height = height
//
//        status = .needCalculate
//
//        setup()
//    }
}

