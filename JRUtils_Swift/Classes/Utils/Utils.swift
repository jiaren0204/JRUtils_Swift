//
//  Utils.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//  0.0.3

import Foundation
import UIKit

public struct Utils {
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

// MARK: 应用帮助
extension Utils {
    /// 跳转到APP Store评分界面
    public static func gotoAppStoreRate(_ appID: String) {
        let urlStr = "https://itunes.apple.com/us/app/itunes-u/id\(appID)?action=write-review&mt=8"
        
        guard let url = URL(string: urlStr) else {
            return
        }
        UIApplication.shared.open(url, options: [UIApplication.OpenExternalURLOptionsKey : Any](), completionHandler: nil)
    }
    
    /// 发邮件
    public static func sendEmail(mailAddress: String, title: String, body: String) {
        //添加收件人,如有多个收件人，可以使用componentsJoinedByString方法连接，连接符为","
        var mailContent = ""
        mailContent += "mailto:\(mailAddress)?"
        
        //添加邮件主题
        mailContent += "&subject=\(title)"
        
        //添加邮件内容
        mailContent += "&body=\(body)"
        
        guard let emailPath = mailContent.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let url = URL(string: emailPath) else {
            return
        }
        
        UIApplication.shared.open(url, options: [UIApplication.OpenExternalURLOptionsKey: Any](), completionHandler: nil)
    }
    
    public static func sendFeedbackMailInApp(feedBack: String, problemDesc: String, mailAddress: String) {
        let device = UIDevice.current
        let systemVersion = device.systemVersion
        
        guard let infoDictionary = Bundle.main.infoDictionary else {
            return
        }
    
        let app_Name = Utils.getDisplayName()
        let app_Version = infoDictionary["CFBundleShortVersionString"] ?? ""
        let appNameAndVersion = "\(app_Name) V\(app_Version)"

        let title = "\(feedBack)(\(app_Name) iOS)"

        let body = "\(problemDesc):\n\n\n\n\n\n\n_____\nfrom \(appNameAndVersion)\nfrom\(device.model) iOS \(systemVersion)"
        
        Utils.sendEmail(mailAddress: mailAddress, title: title, body: body)
    }
    
    public static func getDisplayName() -> String {
        guard let localizedInfoDictionary = Bundle.main.localizedInfoDictionary else {
            return ""
        }
        
        guard let appName = localizedInfoDictionary["CFBundleDisplayName"] as? String else { return "" }
        return appName
    }
    
}
