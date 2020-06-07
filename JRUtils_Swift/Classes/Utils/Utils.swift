//
//  Utils.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation
import UIKit

struct Utils {
    public static func docuPath() -> String {
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
    }
    
    // MARK: 是否刘海手机
    public static func isiPhoneX() -> Bool {
        guard #available(iOS 11.0, *) else {
            return false
        }
        
        return UIApplication.shared.windows[0].safeAreaInsets.bottom > 0
    }
}
