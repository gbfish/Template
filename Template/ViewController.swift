//
//  ViewController.swift
//  Template
//
//  Created by David Yu on 2018/7/9.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width = UIScreen.main.bounds.width
        
        
        var comboLarge = TComboLarge(x: 0, y: 50, width: width, title: "my title")
        _ = comboLarge.setupCombo(for: view)
        
        
        comboComplex = TComboComplex(x: 0, y: 500, width: width)
        _ = comboComplex?.setupCombo(for: view)
        
    }
    
    var comboComplex: TComboComplex?
    
    
//    var combos: [TCombo]
}

