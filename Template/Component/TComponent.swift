//
//  TComponent.swift
//  Template
//
//  Created by David Yu on 2018/7/13.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

protocol TComponent: Template {
    associatedtype ComponentType: UIView
    var component: ComponentType { get }
    func setupComponent(for view: UIView) -> ComponentType
}

extension TComponent {
    mutating func setup(view: UIView) {
        _ = setupComponent(for: view)
    }
    
    func setupComponent(for view: UIView) -> ComponentType {
        let newComponent = component
        view.addSubview(newComponent)
        return newComponent
    }
}

enum TComponentData {
    case view(view: TComponentView)
    case button(button: TComponentButton)
}


//protocol TComponentData {
//
//}


//struct Buffer<Element> {
//
////    subscript(at: Int) -> Element {
////        return
////    }
//}
