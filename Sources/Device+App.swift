//
//  Device+App.swift
//  SimpleDevice iOS
//
//  Created by 刘栋 on 2018/5/12.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Foundation

extension Device {
    
    public var appName: String {
        let name = Bundle.main.localizedInfoDictionary?["CFBundleDisplayName"] as? String
        return name ?? "UNKNOWN NAME"
    }
    
    public var appVersion: String {
        let version = Bundle.main.localizedInfoDictionary?["CFBundleShortVersionString"] as? String
        return version ?? "UNKNOWN VERSION"
    }
    
    public var appBuild: String {
        let build = Bundle.main.localizedInfoDictionary?["CFBundleVersion"] as? String
        return build ?? "UNKNOWN BUILD"
    }
}
