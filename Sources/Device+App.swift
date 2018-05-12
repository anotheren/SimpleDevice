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
        if let name = Bundle.main.localizedInfoDictionary?["CFBundleDisplayName"] as? String {
            return name
        } else if let name = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String {
            return name
        } else {
            return "UNKNOWN NAME"
        }
    }
    
    public static var appVersion: String {
        if let version = Bundle.main.localizedInfoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        } else if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        } else {
            return "UNKNOWN VERSION"
        }
    }
    
    public static var appBuild: String {
        if let build = Bundle.main.localizedInfoDictionary?["CFBundleVersion"] as? String {
            return build
        } else if let build = Bundle.main.localizedInfoDictionary?["CFBundleVersion"] as? String {
            return build
        } else {
            return "UNKNOWN BUILD"
        }
    }
}
