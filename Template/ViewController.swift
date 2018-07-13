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
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        let view = UIView(frame: CGRect.zero)
        
//        if let changeable = view as? Changeable {
//        print("changeable = \(String(describing: view.x))")
        
//        }
//        print("changeable = \(String(describing: view.width))")

//        view.width = 100
//        print("changeable = \(String(describing: view.width))")
        
//        var templateLarge = TemplateLarge(x: 0.0, y: 0.0, width: 100.0, height:0.0, status:.needCalculate)
//        print("size = \(templateLarge.size())")
//
//        print("2 size = \(templateLarge.size())")
//
//        templateLarge.change(width: 500.0)
//
//        print("size width 500 = \(templateLarge.size())")

        
//        var templateLarge = TemplateLarge(x: 0, y: 0, width: 99, height: 0)
        
//        var templateLarge = TemplateLarge(x: 10, y: 20, width: 30, title: "my title")
//        
//        print("templateLarge = \(templateLarge)")
//        
//        print("templateLarge = \(templateLarge.size())")
//        print(" - templateLarge = \(templateLarge.size())")

        
        
//        let newLarge = NewTemplateLarge()
//        newLarge.setupLayout()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let width = UIScreen.main.bounds.width
        var templateLarge = TemplateLarge(x: 0, y: 50, width: width, title: "my title")
        
        
        print("templateLarge 1 = \(templateLarge.size())")
        
        templateLarge.calculate()
        
        print("templateLarge 2 = \(templateLarge.size())")

        templateLarge.setup(view: view)
        
        print("templateLarge 3 = \(templateLarge.size())")

    }

    
    func setupLayout() {
        
    }
    
    func setupView() {
        
    }
    
    func setupAction() {
        
    }

}

