//
//  String+Util.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 截取字符串
extension String {

    public func substring(from: Int?, to: Int?) -> String {
        if let start = from {
            guard start < self.count else {
                return ""
            }
        }
         
        if let end = to {
            guard end >= 0 else {
                return ""
            }
        }
         
        if let start = from, let end = to {
            guard end - start >= 0 else {
                return ""
            }
        }
         
        let startIndex: String.Index
        if let start = from, start >= 0 {
            startIndex = self.index(self.startIndex, offsetBy: start)
        } else {
            startIndex = self.startIndex
        }
         
        let endIndex: String.Index
        if let end = to, end >= 0, end < self.count {
            endIndex = self.index(self.startIndex, offsetBy: end + 1)
        } else {
            endIndex = self.endIndex
        }
         
        return String(self[startIndex ..< endIndex])
    }
    
    public func substring(from: Int) -> String {
        return self.substring(from: from, to: nil)
    }
     
    public func substring(to: Int) -> String {
        return self.substring(from: nil, to: to)
    }
    
    public func substring(from: Int?, length: Int) -> String {
        guard length > 0 else {
            return ""
        }
         
        let end: Int
        if let start = from, start > 0 {
            end = start + length - 1
        } else {
            end = length - 1
        }
         
        return self.substring(from: from, to: end)
    }
    
    public func substring(length: Int, to: Int?) -> String {
        guard let end = to, end > 0, length > 0 else {
            return ""
        }
         
        let start: Int
        if let end = to, end - length > 0 {
            start = end - length + 1
        } else {
            start = 0
        }
         
        return self.substring(from: start, to: to)
    }
}

// MARK: - 计算文本尺寸
extension String {
    // MARK: 计算文本宽度
    public func strWidth(font: UIFont) -> CGFloat {
        return strSize(limitWidth: CGFloat.greatestFiniteMagnitude, font: font).width
    }
    
    // MARK: 计算文本高度
    public func strHeight(limitWidth: CGFloat, font: UIFont) -> CGFloat {
        return strSize(limitWidth: limitWidth, font: font).height
    }
    
    public func strSize(limitWidth: CGFloat, font: UIFont) -> CGSize {
        let size = CGSize(width: limitWidth, height: CGFloat.greatestFiniteMagnitude)
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        return NSString(string: self).boundingRect(with: size, options: option, attributes: [NSAttributedString.Key.font: font], context: nil).size
    }
}
