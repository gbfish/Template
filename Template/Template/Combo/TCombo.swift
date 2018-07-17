//
//  TCombo.swift
//  Template
//
//  Created by David Yu on 2018/7/16.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

protocol TCombo: TemplateSizeable {
    var components: [TComponentData]? { get set }
    mutating func setupCombo(for view: UIView)
}

extension TCombo {
    mutating func setupCombo(for view: UIView) {
        calculateIfNeeded()
        components?.forEach { $0.setupComponent(for: view) }
    }
}
