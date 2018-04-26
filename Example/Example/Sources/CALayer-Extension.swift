//
//  CALayer-Extension.swift
//  Example
//
//  Created by brian on 2018/1/1.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

import UIKit

public extension CALayer {
    
    /// 停止基于CALayer的核心动画
    public func pauseAnimation() {
        let pausedTime = convertTime(CACurrentMediaTime(), from: nil)
        // 让CALayer停止运动
        speed = 0.0
        // 让CALayer的时间停留在pausedTime这个时刻
        timeOffset = pausedTime
    }
    
    /// 继续基于CALayer的核心动画
    public func resumeAnimation() {
        let pauseTime = timeOffset
        // 让layer的时间继续行走
        speed = 1.0
        // 取消上次记录的停留时刻
        timeOffset = 0.0
        beginTime = 0.0
        // 计算暂停时间（也可以用：CACurrentMediaTime() - pauseTime）
        let timeSincePause = convertTime(CACurrentMediaTime(), from: nil) - pauseTime
        // 设置相对于父坐标系的开始事件（往后退timeSincePause）
        beginTime = timeSincePause
    }
}
