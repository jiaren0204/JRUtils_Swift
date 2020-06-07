//
//  URL+Util.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation

extension URL {
    public init(fileURLWithFileName: String) {
        let resourcePath = Bundle.main.resourcePath ?? ""
        let path = "\(resourcePath)/\(fileURLWithFileName)"
        
        self.init(fileURLWithPath: path)
    }
}
