//
//  UILabel+Util.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation
import CoreText
import UIKit

extension UILabel {
    public func getSeparatedLines() -> [String] {
        guard let text = text else {
            return [""]
        }
        
        let fontName: CFString = font.fontName as CFString
        let myFont = CTFontCreateWithName(fontName, font.pointSize, nil)
        let attStr = NSMutableAttributedString(string: text)
        attStr.addAttribute(kCTFontAttributeName as NSAttributedString.Key, value: myFont, range: NSMakeRange(0, attStr.length))
        let frameSetter: CTFramesetter = CTFramesetterCreateWithAttributedString(attStr)
        let path: CGMutablePath = CGMutablePath()
        path.addRect(CGRect(x: 0, y: 0, width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        let frame: CTFrame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
        let lines = CTFrameGetLines(frame) as Array
        var linesArray = [String]()
         
        for line in lines {
            let lineRef: CTLine = line as! CTLine
            let lineRange: CFRange = CTLineGetStringRange(lineRef)
            let range: NSRange = NSMakeRange(lineRange.location, lineRange.length)
            let subStr = text.substring(from: range.location, length: range.length)
            linesArray.append(subStr)
        }
         
        return linesArray
    }
}
