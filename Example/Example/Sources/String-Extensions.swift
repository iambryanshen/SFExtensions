//
//  String-Extensions.swift
//  Example
//
//  Created by brian on 2018/5/8.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

import UIKit

public extension String {
    // 判断一段字符串中是否包含中文字符
    public func isIncludeChineseCharacter() -> Bool {
        for char in self {
            if ("\u{4E00}" <= char  && char <= "\u{9FA5}") {
                return true
            }
        }
        return false
    }
}
