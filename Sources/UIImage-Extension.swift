//
//  UIImage-Extension.swift
//  Example
//
//  Created by brian on 2018/1/1.
//  Copyright © 2018年 brian. All rights reserved.
//

import UIKit

public extension UIImage {
    
    /// 返回原始图片
    ///
    /// - Returns: 原始图片
    public func originalImage() -> UIImage {
        return self.withRenderingMode(.alwaysOriginal)
    }
    
    /// 根据颜色（RGB值）创建image
    ///
    /// - Parameter color: 所需图片的颜色
    /// - Returns: 带有颜色的image
    public class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {return UIImage()}
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 返回一张带有边框的图片
    ///
    /// - Parameters:
    ///   - borderWidth: 边框的宽度，可以为0，默认就是0
    ///   - borderColor: 边框的颜色，默认为clear
    /// - Returns: 一张带有（可不带有）边框的图片
    public func roundImage(borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) -> UIImage? {
        // 1. 开启一个位图上下文，因为左右边框，所以需要加两倍的边框宽度
        UIGraphicsBeginImageContext(CGSize(width: self.size.width + borderWidth * 2, height: self.size.width + borderWidth * 2))
        // 2. 获取一个圆形路径，用来实现圆形边框的效果
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: self.size.width + borderWidth * 2, height: self.size.width + borderWidth * 2))
        // 3. 设置填充颜色和填充到上下文中
        borderColor.set()
        path.fill()
        // 4.获取小圆圆形区域（用来设置圆形裁剪区域）
        let clipPath = UIBezierPath(ovalIn: CGRect(x: borderWidth, y: borderWidth, width: self.size.width, height: self.size.width))
        // 5. 设置路径为上下文的裁剪区域，超过裁剪区域以外的内容会被裁剪（对之后绘制的内容有效，对已绘制到上下文的内容无效）
        clipPath.addClip()
        // 7. 把图片绘制到上下文中
        self.draw(at: CGPoint(x: borderWidth, y: borderWidth))
        // 8. 从上下文中生成一张图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        // 9. 关闭上下文
        UIGraphicsEndImageContext()
        return newImage
    }
}
