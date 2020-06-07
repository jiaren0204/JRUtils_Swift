//
//  UIView+Util.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Frame
extension UIView {
    public var x: CGFloat {
        set {
            var frame = self.frame;
            frame.origin.x = newValue;
            self.frame = frame;
        }
        get { self.frame.origin.x }
    }
    
    public var y: CGFloat {
        set {
            var frame = self.frame;
            frame.origin.y = newValue;
            self.frame = frame;
        }
        get { self.frame.origin.y }
    }
    
    public var centerX: CGFloat {
        set {
            var center = self.center;
            center.x = newValue;
            self.center = center;
        }
        get { self.center.x }
    }
    
    public var centerY: CGFloat {
        set {
            var center = self.center;
            center.y = newValue;
            self.center = center;
        }
        get { self.center.y }
    }
    
    public var width: CGFloat {
        set {
            var frame = self.frame;
            frame.size.width = newValue;
            self.frame = frame;
        }
        get { self.frame.size.width }
    }
    
    public var height: CGFloat {
        set {
            var frame = self.frame;
            frame.size.height = newValue;
            self.frame = frame;
        }
        get { self.frame.size.height }
    }
    
    public var size: CGSize {
        set {
            var frame = self.frame;
            frame.size = newValue;
            self.frame = frame;
        }
        get { self.frame.size }
    }
}

// MARK: - 获取特定位置的颜色
extension UIView {
    /// 获取特定位置的颜色
    /// - parameter at: 位置
    /// - returns: 颜色
    public func pickColor(at position: CGPoint) -> UIColor? {
        // 用来存放目标像素值
        var pixel = [UInt8](repeatElement(0, count: 4))
        // 颜色空间为 RGB，这决定了输出颜色的编码是 RGB 还是其他（比如 YUV）
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        // 设置位图颜色分布为 RGBA
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue
        guard let context = CGContext(data: &pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo) else {
            return nil
        }
        // 设置 context 原点偏移为目标位置所有坐标
        context.translateBy(x: -position.x, y: -position.y)
        // 将图像渲染到 context 中
        layer.render(in: context)
        
        return UIColor(red: CGFloat(pixel[0]) / 255.0,
                       green: CGFloat(pixel[1]) / 255.0,
                       blue: CGFloat(pixel[2]) / 255.0,
                       alpha: CGFloat(pixel[3]) / 255.0)
    }
}
