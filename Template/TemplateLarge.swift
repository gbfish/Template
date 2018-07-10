//
//  TemplateLarge.swift
//  Template
//
//  Created by David Yu on 2018/7/9.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

struct TemplateLarge: Template {
    
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
    
    mutating func calculate() {
        print(self)
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
            

            let paragraph1DataArray: [TCTextViewDataProtocol] = [
                TCTextViewDataIcon(iconName: "sign-check-icon", iconSize: CGSize(width: 30, height: 30)),
                TCTextViewDataText(text: "title first", font: UIFont.systemFont(ofSize: 20), color: UIColor.yellow),
                TCTextViewDataText(text: "title second", font: UIFont.systemFont(ofSize: 15), color: UIColor.blue)]
            
            let paragraph1 = TCTextViewDataParagraph(isLastParagraph: false, paragraphSpacing: 0, dataArray: paragraph1DataArray)
            
            
            let paragraph2DataArray = [TCTextViewDataText(text: "detail first", font: UIFont.systemFont(ofSize: 25), color: UIColor.yellow), TCTextViewDataText(text: "detail second detail second detail second detail second detail second", font: UIFont.systemFont(ofSize: 10), color: UIColor.blue)]
    
            let paragraph2 = TCTextViewDataParagraph(isLastParagraph: true, paragraphSpacing: 0, dataArray: paragraph2DataArray)
            
            let dataArray = [paragraph1, paragraph2]
            
            let templateComponentTextView = TCTextView(x: 10, y: 50, width: width - 20, dataArray: dataArray, exclusionRectArray: [CGRect(x: 0, y: 0, width: 50, height: 50)])
            
            items?.append(templateComponentTextView)
            
//            (x: 10, y: 10, width:width - 20, height: 0, status: .needCalculate, dataArray: dataArray)
            
            
//            if let items = items {
//                for index in items.indices {
//                    var item = items[index]
//                    item.calculate()
//                }
//            }
            
            
//            height = 200.0
            status = .normal
        }
        print(self)
    }
    
    mutating func setup(view: UIView) {
        calculate()
        
        if let items = items {
            for index in items.indices {
                var item = items[index]
                item.setup(view: view)
            }
        }

    }

}
