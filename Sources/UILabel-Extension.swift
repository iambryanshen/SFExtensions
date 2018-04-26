
//
//  UILabel-Extension.swift
//  Example
//
//  Created by brian on 2018/4/26.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

import UIKit

extension UILabel {
    
    var sf : UILabelExtension {
        return UILabelExtension(label: self)
    }
}

struct UILabelExtension {
    
    internal let label : UILabel
    
    internal init(label: UILabel) {
        self.label = label
    }
    
    /// 设置Label的行间距和字间距
    ///
    /// - Parameters:
    ///   - lineSpace: 行间距
    ///   - wordSpace: 字间距
    func changeLabelRowSpace(lineSpace: CGFloat, wordSpace: CGFloat) {
        guard let content = label.text else {return}
        let attributedString : NSMutableAttributedString = NSMutableAttributedString(string: content)
        let paragraphStyle : NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, (content.count)))
        attributedString.addAttribute(NSAttributedStringKey.kern, value: wordSpace, range: NSMakeRange(0, (content.count)))
        label.attributedText = attributedString
        label.sizeToFit()
    }
    
    
    /// 指定Label显示的字的个数
    ///
    /// - Parameter number: 个数
    func specifiesTheNumberOfWordsToDisplay(number: Int) {
        guard let content = label.text else {return}
        let attributedString : NSMutableAttributedString = NSMutableAttributedString(string: content)
        if content.count < number {return}
        attributedString.deleteCharacters(in: NSMakeRange(number, content.count - number))
        label.attributedText = attributedString
        label.sizeToFit()
    }
}
