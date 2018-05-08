//
//  String-Extension.swift
//  ITOVR
//
//  Created by brian on 2018/5/8.
//  Copyright © 2018年 jietusoft. All rights reserved.
//

import UIKit

extension String {
    // 判断一段字符串中是否包含中文字符
    func isIncludeChineseCharacter() -> Bool {
        for char in self {
            if ("\u{4E00}" <= char  && char <= "\u{9FA5}") {
                return true
            }
        }
        return false
    }
}
