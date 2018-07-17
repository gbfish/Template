//
//  TComboLarge.swift
//  Template
//
//  Created by David Yu on 2018/7/16.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

struct TComboLarge: TCombo {
    var components: [TComponentData]?
    
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var status: TemplateSizeableStatus
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, title: String) {
        self.x = x
        self.y = y
        self.width = width
        self.height = 0
        //        self.title = title
        
        status = .needCalculate
    }
    
    mutating func calculate() {
        components = [TComponentData]()
        
        // background
        
        var backgroundView = TComponentView(x: x, y: y, width: width, height: 0, color: UIColor.black)
        
        
        // textView
        
        let words1: [TComponentTextViewDataWord] = [
            TComponentTextViewDataWordIcon(iconName: "sign-check-icon", iconSize: CGSize(width: 30, height: 30)),
            TComponentTextViewDataWordText(text: "It is the title with icon.", font: UIFont.systemFont(ofSize: 20), color: UIColor.yellow),
            TComponentTextViewDataWordText(text: " It is the long long long long long long long long long long long long long long long long long long subtitle.", font: UIFont.systemFont(ofSize: 15), color: UIColor.blue)]
        let paragraph1 = TComponentTextViewDataParagraph(paragraphSpacing: 20, words: words1)
        
        let words2 = [TComponentTextViewDataWordText(text: "Here is a summary.", font: UIFont.systemFont(ofSize: 25), color: UIColor.orange), TComponentTextViewDataWordText(text: "Here is a long long long long long long long long long long long long long long long long long summary.", font: UIFont.systemFont(ofSize: 10), color: UIColor.white)]
        let paragraph2 = TComponentTextViewDataParagraph(paragraphSpacing: 0, words: words2)
        
        let paragraphs = [paragraph1, paragraph2]
        let article = TComponentTextViewDataArticle(paragraphs: paragraphs)
        
        var templateComponentTextView = TComponentTextView(x: x + 5, y: y + 5, width: width - 10, article: article, exclusionRectArray: [CGRect(x: 0, y: 0, width: 50, height: 50)])
        templateComponentTextView.calculateIfNeeded()
        
        // button
        
        let button = TComponentButton(x: templateComponentTextView.x, y: templateComponentTextView.y, width: 50, height: 50) {
            print("This is the action from button!!!")
        }
        
        /////
        
        backgroundView.height = templateComponentTextView.height + 10
        let dataBackgroundView = TComponentData.view(view: backgroundView)
        components?.append(dataBackgroundView)
        
        
        let dataTextView = TComponentData.textView(textView: templateComponentTextView)
        components?.append(dataTextView)
        
        let dataButton = TComponentData.button(button: button)
        components?.append(dataButton)
        ////
        
        height = backgroundView.y + backgroundView.height
    }
}
