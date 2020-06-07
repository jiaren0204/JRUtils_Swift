//
//  UIImage+Util.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    public class func colorImage(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {

        let frame = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(frame)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}
