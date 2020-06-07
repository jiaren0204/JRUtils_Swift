//
//  UIFont+Util.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {

    public enum FontName: String {
        case pingFangRegular = "PingFangSC-Regular"
        case pingFangMedium = "PingFangSC-Medium"
    }
    
    public class func pingFangRegular(_ size: CGFloat) -> UIFont {
        UIFont(name: FontName.pingFangRegular.rawValue, size: size)!
    }
    
    public class func pingFangMedium(_ size: CGFloat) -> UIFont {
        UIFont(name: FontName.pingFangMedium.rawValue, size: size)!
    }
}
