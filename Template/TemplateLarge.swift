//
//  TemplateLarge.swift
//  Template
//
//  Created by David Yu on 2018/7/9.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

struct TemplateLarge: Changeable {
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var status: Status
    var items: [Changeable]?
    
    var title: String
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, title: String) {
        self.x = x
        self.y = y
        self.width = width
        self.height = 0
        self.title = title
        
        status = .needCalculate
    }
    /*
    mutating func setup() {
        itemsArray = [Changeable]()
        
        //        let item1 = TemplateLarge(x: 10.0, y: 20.0, width: 50.0, height: 0.0, status: .needCalculate, itemsArray: nil)
        //        let item2 = TemplateLarge(x: 20.0, y: 30.0, width: 70.0, height: 0.0, status: .needCalculate, itemsArray: nil)
        //
        //        itemsArray?.append(item1)
        //        itemsArray?.append(item2)
    }*/
    
    mutating func calculate() {
        print(self)
        if status == .needCalculate {
            items = [Changeable]()
            
            //            let item1 = TemplateLarge(x: 10.0, y: 10.0, width: 50.0, height: 0.0, status: .needCalculate, itemsArray: nil)
            
            //            itemsArray?.append(item1)
            
            
            
//            if let itemsArray = itemsArray {
//                for item in items {
//
//                }
//            }
            
            if let items = items {
                for index in items.indices {
                    var item = items[index]
                    item.calculate()
                }
            }
            
            
            height = 200.0
            status = .normal
        }
        print(self)
    }
    
    mutating func setup(view: UIView) {
        calculate()
        
        if let items = items {
            for item in items {
//                item.setup(view: view)
            }
        }
    }

}
