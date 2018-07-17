//
//  TComboComplex.swift
//  Template
//
//  Created by David Yu on 2018/7/16.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

struct TComboComplex: TCombo {
    
    init(x: CGFloat, y: CGFloat, width: CGFloat) {
        self.x = x
        self.y = y
        self.width = width
        self.height = 0
        
        status = .needCalculate
    }
    
    var backgroundView: UIView?
    
    // MARK: - TCombo
    
    var components: [TComponentData]?
    
    mutating func setupCombo(for view: UIView) {
        calculateIfNeeded()
        
        if let dataBackgroundView = components?.first {
            
            switch dataBackgroundView {
            case .view(var theView):
                backgroundView = theView.setupComponent(for: view)
                break
                
            default:
                break
            }
            
        }
        
        // button
        
        func foo(theView: inout UIView?) {
            theView?.backgroundColor = UIColor.green
        }
        
        let abc = UnsafeMutablePointer(&backgroundView)
        
        var button = TComponentButton(x: x + 10, y: y + 10, width: width - 20, height: height - 20) {
            print("print button!!!")
//            selfPointer.backgroundView?.backgroundColor = UIColor.green
            
            abc.pointee?.backgroundColor = UIColor.green
        }
    
        _ = button.setupComponent(for: view)
        
        
    }
    
    // MARK: - TemplateSizeable
    
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var status: TemplateSizeableStatus
    
    mutating func calculate() {
        // background
        
        let backgroundView = TComponentView(x: x, y: y, width: width, height: 100, color: UIColor.blue)
        
        
        components = [TComponentData]()
        
        let dataBackgroundView = TComponentData.view(view: backgroundView)
        components?.append(dataBackgroundView)
        
    }
}
