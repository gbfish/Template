//
//  TemplateComponentTextView.swift
//  Template
//
//  Created by David Yu on 2018/7/10.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

struct TCTextView: Template {
    
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var status: Status
    var items: [Template]?
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, dataArray: [TCTextViewDataProtocol], exclusionRectArray: [CGRect]?) {
        self.x = x
        self.y = y
        self.width = width
        self.height = 0
        
        self.dataArray = dataArray
        self.exclusionRectArray = exclusionRectArray
        
        status = .needCalculate
    }
    
    mutating func calculate() {
        _ = myTextView()
        status = .normal
    }
    
    mutating func setup(view: UIView) {
        view.addSubview(myTextView())
    }
    
    // MARK: UITextView
    
    private var textView: UITextView?
    
    mutating func myTextView() -> UITextView {
        if let textView = textView {
            return textView
        } else {
            textView = UITextView(frame: frame)
            textView!.attributedText = attributedString()
            textView!.backgroundColor = UIColor.red
            textView!.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            textView!.textContainer.lineFragmentPadding = 0
            textView!.isEditable = false
            textView!.isSelectable = false
            textView!.isSelectable = false
            textView!.textAlignment = NSTextAlignment.left
            
            textView!.textContainer.exclusionPaths = exclusionPaths()
            
            let newSize = textView!.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
            height = newSize.height
            textView!.frame = frame
            
            return textView!
        }
    }
    
    // MARK: Exclusion Paths
    
    let exclusionRectArray: [CGRect]?
    
    private func exclusionPaths() -> [UIBezierPath] {
        var exclusionPaths = [UIBezierPath]()
        exclusionRectArray?.forEach({
            exclusionPaths.append(UIBezierPath(rect: $0))
        })
        return exclusionPaths
    }
    
    // MARK: Data
    
    var dataArray: [TCTextViewDataProtocol]
    
    private func attributedString() -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        dataArray.forEach { attributedString.append($0.attributedString()) }
        return attributedString
    }
}

// MARK: - Data

protocol TCTextViewDataProtocol {
    func attributedString() -> NSAttributedString
}

struct TCTextViewDataParagraph: TCTextViewDataProtocol {
    
    var isLastParagraph: Bool
    var paragraphSpacing: CGFloat
    var dataArray: [TCTextViewDataProtocol]
    
    init(isLastParagraph: Bool, paragraphSpacing: CGFloat, dataArray: [TCTextViewDataProtocol]) {
        self.isLastParagraph = isLastParagraph
        self.paragraphSpacing = paragraphSpacing
        self.dataArray = dataArray
    }
    
    func attributedString() -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        dataArray.forEach { attributedString.append($0.attributedString()) }
        
        if isLastParagraph == false {
            let returnAttributedString = NSAttributedString(string: "\n")
            attributedString.insert(returnAttributedString, at: attributedString.length)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 0
            paragraphStyle.paragraphSpacing = paragraphSpacing
            
            let range = NSRange(location: 0, length: attributedString.length)
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        }
        
        return attributedString
    }
}
    
struct TCTextViewDataText: TCTextViewDataProtocol {
    
    let text: String
    let font: UIFont
    let color: UIColor
    
    init(text: String, font: UIFont, color: UIColor) {
        self.text = text
        self.font = font
        self.color = color
    }

    func attributedString() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: attributedString.length)
        
        attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)

        return attributedString
    }
}

struct TCTextViewDataIcon: TCTextViewDataProtocol {
    
    let iconName: String
    let iconSize: CGSize
    
    init(iconName: String, iconSize: CGSize) {
        self.iconName = iconName
        self.iconSize = iconSize
    }
    
    func attributedString() -> NSAttributedString {
        let textAttachment = NSTextAttachment()
        textAttachment.image = UIImage(named: iconName)
        textAttachment.bounds = CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height)
        
        let attributedString = NSAttributedString(attachment: textAttachment)
        
        return attributedString
    }
}
