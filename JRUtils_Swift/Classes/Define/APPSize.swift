//
//  APPSize.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation
import UIKit

public struct APPSize {
    public static let screenWidth = UIScreen.main.bounds.size.width
    public static let screenHeight = UIScreen.main.bounds.size.height
    
    public static var safeAreaBottom: CGFloat {
        return Utils.isiPhoneX() ? 34 : 0
    }
    
    public static var statusBarHeight: CGFloat {
        return Utils.isiPhoneX() ? 44 : 20
    }
    
    public static let tabbarHeight = safeAreaBottom + 49
    public static let statusBarNavHeight = statusBarHeight + 44
    public static let navHeight: CGFloat = 44
    
    public enum screenUI {
        case none
        case statusBar
        case statusBarNav
        case tabbar
        case statusBarTabbar
        case statusBarNavTabbar
    }
    
    public static func screenSize(ui: screenUI = .none) -> CGSize {
        let heightDic: [screenUI: CGFloat] =
            [.none: 0,
             .statusBar: APPSize.statusBarHeight,
             .statusBarNav: APPSize.statusBarNavHeight,
             .tabbar: APPSize.tabbarHeight,
             .statusBarTabbar: APPSize.statusBarHeight + APPSize.tabbarHeight,
             .statusBarNavTabbar: APPSize.statusBarNavHeight + APPSize.tabbarHeight]
        
        return CGSize(width: screenWidth, height: screenHeight - heightDic[ui]!)
    }
}
