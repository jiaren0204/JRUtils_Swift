//
//  Int+Util.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 颜色
extension Int {
    public var color: UIColor {
      let red = CGFloat(self as Int >> 16 & 0xff) / 255
      let green = CGFloat(self >> 8 & 0xff) / 255
      let blue  = CGFloat(self & 0xff) / 255
      return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
