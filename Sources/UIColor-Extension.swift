
//
//  UIColor-Extension.swift
//  Example
//
//  Created by brian on 2018/4/26.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// 获取颜色
    ///
    /// - Parameters:
    ///   - r: red（0~255）
    ///   - g: green（0~255）
    ///   - b: blue（0~255）
    ///   - a: alpha（0~1）
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    /// 获取随机颜色
    ///
    /// - Returns: 随机颜色
    public static func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256))/255
        let green = CGFloat(arc4random_uniform(256))/255
        let blue = CGFloat(arc4random_uniform(256))/255
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        return color
    }
}
