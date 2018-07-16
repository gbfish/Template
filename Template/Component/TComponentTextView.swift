//
//  TComponentTextView.swift
//  Template
//
//  Created by David Yu on 2018/7/13.
//  Copyright © 2018年 David Yu. All rights reserved.
//

import UIKit

struct TComponentTextView: TComponent {
    typealias ComponentType = UITextView
    
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var status: Status
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, article: TComponentTextViewDataArticle, exclusionRectArray: [CGRect]?) {
        self.x = x
        self.y = y
        self.width = width
        self.height = 0
        status = .needCalculate
        
        self.article = article
        self.exclusionRectArray = exclusionRectArray
    }
    
    mutating func calculate() {
        let textView = component
        
        let newSize = textView.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        height = newSize.height
        
        status = .normal
    }
    
    // MARK: UITextView
    
    var component: UITextView {
        let textView = UITextView(frame: frame)
        textView.attributedText = article.attributedString
        textView.backgroundColor = UIColor.red
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        textView.textContainer.lineFragmentPadding = 0
        textView.isEditable = false
        textView.isSelectable = false
        textView.isSelectable = false
        textView.textAlignment = NSTextAlignment.left
        
        textView.textContainer.exclusionPaths = exclusionPaths()
        
        return textView
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
    
    var article: TComponentTextViewDataArticle
}

// MARK: - Data

protocol TComponentTextViewData {
    var attributedString: NSAttributedString { get }
}

// MARK: Article

struct TComponentTextViewDataArticle: TComponentTextViewData {
    var paragraphs: [TComponentTextViewDataParagraph]
    
    init(paragraphs: [TComponentTextViewDataParagraph]) {
        self.paragraphs = paragraphs
        
        if var lastParagraph = paragraphs.last {
            lastParagraph.isLastParagraph = true
            self.paragraphs[paragraphs.endIndex - 1] = lastParagraph
        }
    }
    
    var attributedString: NSAttributedString {
        let attributedString = NSMutableAttributedString()
        paragraphs.forEach { attributedString.append($0.attributedString) }
        return attributedString
    }
}

// MARK: Paragraph

struct TComponentTextViewDataParagraph: TComponentTextViewData {
    var paragraphSpacing: CGFloat
    var isLastParagraph: Bool
    var words: [TComponentTextViewDataWord]
    
    init(paragraphSpacing: CGFloat, words: [TComponentTextViewDataWord]) {
        self.paragraphSpacing = paragraphSpacing
        self.words = words
        
        self.isLastParagraph = false
    }
    
    var attributedString: NSAttributedString {
        let attributedString = NSMutableAttributedString()
        words.forEach { attributedString.append($0.attributedString) }
        
        if self.isLastParagraph == false {
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

// MARK: Word

protocol TComponentTextViewDataWord: TComponentTextViewData {
}

struct TComponentTextViewDataWordText: TComponentTextViewDataWord {
    let text: String
    let font: UIFont
    let color: UIColor
    
    init(text: String, font: UIFont, color: UIColor) {
        self.text = text
        self.font = font
        self.color = color
    }
    
    var attributedString: NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: attributedString.length)
        
        attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        
        return attributedString
    }
}

struct TComponentTextViewDataWordIcon: TComponentTextViewDataWord {
    let iconName: String
    let iconSize: CGSize
    
    init(iconName: String, iconSize: CGSize) {
        self.iconName = iconName
        self.iconSize = iconSize
    }
    
    var attributedString: NSAttributedString {
        let textAttachment = NSTextAttachment()
        textAttachment.image = UIImage(named: iconName)
        textAttachment.bounds = CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height)
        
        let attributedString = NSAttributedString(attachment: textAttachment)
        
        return attributedString
    }
}
