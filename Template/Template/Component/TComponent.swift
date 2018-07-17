//
//  TComponent.swift
//  Template
//
//  Created by David Yu on 2018/7/13.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

protocol TComponent: TemplateSizeable {
    associatedtype ComponentType: UIView
    var component: ComponentType { get }
    mutating func setupComponent(for view: UIView) -> ComponentType
}

extension TComponent {
    mutating func setupComponent(for view: UIView) -> ComponentType {
        calculateIfNeeded()
        let newComponent = component
        view.addSubview(newComponent)
        return newComponent
    }
}

enum TComponentData {
    case view(view: TComponentView)
    case button(button: TComponentButton)
    case textView(textView: TComponentTextView)
    
    func setupComponent(for view: UIView) {
        switch self {
        case .view(var componentView):
            _ = componentView.setupComponent(for: view)
        case .button(var componentButton):
            _ = componentButton.setupComponent(for: view)
        case .textView(var componentTextView):
            _ = componentTextView.setupComponent(for: view)
        }
    }
}
