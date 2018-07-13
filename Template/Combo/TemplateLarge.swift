//
//  TemplateLarge.swift
//  Template
//
//  Created by David Yu on 2018/7/9.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

class TemplateLarge: Template {
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var status: Status
    var items: [Template]?
    
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
    
    func calculate() {
        
        
//        let newProtocol = [TComponent]()
        
        
//        print(self)
        if status == .needCalculate {
            items = [Template]()
            
            //            let item1 = TemplateLarge(x: 10.0, y: 10.0, width: 50.0, height: 0.0, status: .needCalculate, itemsArray: nil)
            
            //            itemsArray?.append(item1)
            
            
            
//            if let itemsArray = itemsArray {
//                for item in items {
//
//                }
//            }
            
//            var dataArray = [TemplateComponentTextViewDataProtocol]()
//
//            let titleData = TemplateComponentTextViewDataText(pargraphIsEnd: false, paragraphSpacing: 50, text: title, font: UIFont.systemFont(ofSize: 20), color: UIColor.blue)
//            dataArray.append(titleData)
//
//            let summaryData = TemplateComponentTextViewDataText(pargraphIsEnd: true, paragraphSpacing: 50, text: "summary summary summary", font: UIFont.systemFont(ofSize: 15), color: UIColor.yellow)
//            dataArray.append(summaryData)
//
//            let lastData = TemplateComponentTextViewDataText(pargraphIsEnd: false, paragraphSpacing: 0, text: "last", font: UIFont.systemFont(ofSize: 15), color: UIColor.yellow)
//            dataArray.append(lastData)
//
//            let templateComponentTextView = TemplateComponentTextView(x: 10, y: 50, width: width - 20, dataArray: dataArray, exclusionRectArray: nil)
            
            
            let backgroundView = TComponentView(x: 5, y: 5, width: width - 10, height: 0, color: UIColor.black)
            items?.append(backgroundView)
            
            

            let words1: [TComponentTextViewDataWord] = [
                TComponentTextViewDataWordIcon(iconName: "sign-check-icon", iconSize: CGSize(width: 30, height: 30)),
                TComponentTextViewDataWordText(text: "title first", font: UIFont.systemFont(ofSize: 20), color: UIColor.yellow),
                TComponentTextViewDataWordText(text: "title second", font: UIFont.systemFont(ofSize: 15), color: UIColor.blue)]
            let paragraph1 = TComponentTextViewDataParagraph(paragraphSpacing: 10, words: words1)
            
            let words2 = [TComponentTextViewDataWordText(text: "detail first", font: UIFont.systemFont(ofSize: 25), color: UIColor.yellow), TComponentTextViewDataWordText(text: "detail second detail second detail second detail second detail second", font: UIFont.systemFont(ofSize: 10), color: UIColor.blue)]
            let paragraph2 = TComponentTextViewDataParagraph(paragraphSpacing: 0, words: words2)
            
            let paragraphs = [paragraph1, paragraph2]
            let article = TComponentTextViewDataArticle(paragraphs: paragraphs)
            
            var templateComponentTextView = TComponentTextView(x: 10, y: 50, width: width - 20, article: article, exclusionRectArray: [CGRect(x: 0, y: 0, width: 50, height: 50)])
            
            
            templateComponentTextView.calculate()
            
            items?.append(templateComponentTextView)
            
            var item0 = items![0]
            item0.height = templateComponentTextView.y + templateComponentTextView.height - item0.y
            items![0] = item0
            
            var button = TComponentButton(x: 50, y: 50, width: 50, height: 50) {
                print("This is the action from button!!!")
                
                //            if let theBackgroundView = self.items![0] as? TCView {
                //                theBackgroundView.changeColor()
                //            }
                //            self.backgroundViewFromTeplate?.backgroundColor = UIColor.lightGray
                
            }
            items?.append(button)
            
            
//            let button = TCButton(x: 50, y: 50, width: 50, height: 50) {
//                print("This is the action from button!!!")
//
//                if let theBackgroundView = self.items![0] as? TCView {
//                    theBackgroundView.changeColor()
//                }
//
//
//            }
//
//            items?.append(button)
            
//            (x: 10, y: 10, width:width - 20, height: 0, status: .needCalculate, dataArray: dataArray)
            
            
//            if let items = items {
//                for index in items.indices {
//                    var item = items[index]
//                    item.calculate()
//                }
//            }
            
            
//            height = 200.0
            
            
            height = templateComponentTextView.y + templateComponentTextView.height
            status = .normal
        }
        print(self)
    }
    
    func setup(view: UIView) {
//        calculate()
        
        if var items = items {
            for index in items.indices {
                var item = items[index]
                
                
                
                if var theView = item as? TComponentView {
                    backgroundViewFromTeplate = theView.setupComponent(for: view)
                } else if var theTextView = item as? TComponentTextView {
                    textViewFromTeplate = theTextView.setupComponent(for: view)
                } else if var theButton = item as? TComponentButton {
                    buttonFromTeplate = theButton.setupComponent(for: view)
                } else {
                    item.setup(view: view)
                }
                
            }
        }
        /*
        if let theBackgroundView = self.items![0] as? TCView {
            backgroundViewFromTeplate = theBackgroundView.theViewFromStrcut()
        }
        */
        /*
        var button = TCButton(x: 50, y: 50, width: 50, height: 50) {
            print("This is the action from button!!!")
            
//            if let theBackgroundView = self.items![0] as? TCView {
//                theBackgroundView.changeColor()
//            }
//            self.backgroundViewFromTeplate?.backgroundColor = UIColor.lightGray
            
        }*/
        
        if var button = self.items![2] as? TComponentButton {
            
            
            buttonFromTeplate?.removeFromSuperview()
            
            button.action = {
                print("It changes here.")
                self.backgroundViewFromTeplate?.backgroundColor = UIColor.lightGray
                
                self.textViewFromTeplate?.backgroundColor = UIColor.orange
            }
            
            self.items![2] = button
            
            _ = button.setup(view: view)
        }
        
        
        
        
        
        
//        items?.append(button)
//
//        button.setup(view: view)
    }

    var backgroundViewFromTeplate: UIView?
    var textViewFromTeplate: UITextView?

    var buttonFromTeplate: UIButton?

}
