//
//  TCombo.swift
//  Template
//
//  Created by David Yu on 2018/7/16.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

protocol TCombo: Template {
    var components: [TComponentData]? { get set }
    func setupCombo(for view: UIView) -> UIView
}

extension TCombo {
    
    
}

struct TComboLarge: TCombo {
    var components: [TComponentData]?
    
    func setupCombo(for view: UIView) -> UIView {
        return UIView()
    }
    
    var x: CGFloat
    
    var y: CGFloat
    
    var width: CGFloat
    
    var height: CGFloat
    
    var status: Status
    
    mutating func setup(view: UIView) {
        
        /////
        let backgroundView = TComponentView(x: 5, y: 5, width: width - 10, height: 0, color: UIColor.black)
        
        let dataView = TComponentData.view(view: backgroundView)
        
        components?.append(dataView)
        
        //
        
        
        components?.forEach({ data in
            switch data {
            case .view(let componentView):
                let abc = componentView.setupComponent(for: view)
            case .button(let componentButton):
                _ = componentButton.setupComponent(for: view)
            }
        })
        
        /////
    }
    
    
}

