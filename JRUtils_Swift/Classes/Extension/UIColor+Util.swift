//
//  UIColor+Util.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    //16进制转rgba(透明度自己定)
    public class func hex(rgb:Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16))/255.0,
            green: ((CGFloat)((rgb & 0xFF00) >> 8))/255.0,
            blue: ((CGFloat)(rgb & 0xFF))/255.0,
            alpha: alpha)
    }
    //16进制转rgb（透明度数值为固定值1.0）
    public class func hex(rgb:Int) -> UIColor {
        return UIColor.hex(rgb: rgb, alpha: 1.0)
    }
    
    //随机颜色（给控件一个背景色，方便调试）
    public class func random() -> UIColor {
        let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let alpha = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        return UIColor.init(red:red, green:green, blue:blue , alpha: alpha)
    }
    
    public func getRGB() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red = CGFloat(0)
        var green = CGFloat(0)
        var blue = CGFloat(0)
        var alpha = CGFloat(0)
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
    
    public func getHue() -> (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var hue = CGFloat(0)
        var saturation = CGFloat(0)
        var brightness = CGFloat(0)
        var alpha = CGFloat(0)
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return (hue, saturation, brightness, alpha)
    }
}

// MARK: 通过Hue判断是否相等
precedencegroup ColorPrecedence {
    associativity: none
    higherThan: ComparisonPrecedence
}

infix operator == : ColorPrecedence
public func == (color1: UIColor, color2: UIColor) -> Bool {
    let hue1 = color1.getHue()
    let hue2 = color2.getHue()
    return hue1.hue == hue2.hue &&
        hue1.saturation == hue2.saturation &&
        hue1.brightness == hue2.brightness &&
        hue1.alpha == hue2.alpha
}


// 颜色alpha符号运算
precedencegroup AlphaPrecedence {
    associativity: left
    higherThan: RangeFormationPrecedence
    lowerThan: AdditionPrecedence
}

infix operator ~ : AlphaPrecedence

public func ~ (color: UIColor, alpha: Int) -> UIColor {
  return color ~ CGFloat(alpha)
}
public func ~ (color: UIColor, alpha: Float) -> UIColor {
  return color ~ CGFloat(alpha)
}
public func ~ (color: UIColor, alpha: CGFloat) -> UIColor {
  return color.withAlphaComponent(alpha)
}

postfix operator %
public postfix func % (percent: Int) -> CGFloat {
  return CGFloat(percent)%
}
public postfix func % (percent: Float) -> CGFloat {
  return CGFloat(percent)%
}
public postfix func % (percent: CGFloat) -> CGFloat {
  return percent / 100
}
