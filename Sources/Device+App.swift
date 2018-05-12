//
//  Device+App.swift
//  SimpleDevice iOS
//
//  Created by 刘栋 on 2018/5/12.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Foundation

extension Device {
    
    public static var appName: String {
        let key = "CFBundleDisplayName"
        if let name = Bundle.main.localizedInfoDictionary?[key] as? String {
            return name
        } else if let name = Bundle.main.infoDictionary?[key] as? String {
            return name
        } else {
            return "UNKNOWN NAME"
        }
    }
    
    public static var appVersion: String {
        let key = "CFBundleShortVersionString"
        if let version = Bundle.main.localizedInfoDictionary?[key] as? String {
            return version
        } else if let version = Bundle.main.infoDictionary?[key] as? String {
            return version
        } else {
            return "UNKNOWN VERSION"
        }
    }
    
    public static var appBuild: String {
        let key = "CFBundleVersion"
        if let build = Bundle.main.localizedInfoDictionary?[key] as? String {
            return build
        } else if let build = Bundle.main.infoDictionary?[key] as? String {
            return build
        } else {
            return "UNKNOWN BUILD"
        }
    }
}
