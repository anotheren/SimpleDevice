//
//  Device+Screen.swift
//  SimpleDevice
//
//  Created by 刘栋 on 2018/5/11.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import UIKit

extension Device {
    
    public enum Screen {
        case retina_4_0
        case retina_4_7
        case retina_5_5
        case retina_7_9
        case retina_9_7
        case retina_10_5
        case retina_12_9
        case superRetina_5_8
        case unknown
    }
    
    public var screen: Screen {
        switch self {
        case .iPod6: return .retina_4_0
        case .iPhone5s: return .retina_4_0
        case .iPhone6: return .retina_4_7
        case .iPhone6Plus: return .retina_5_5
        case .iPhone6s: return .retina_4_7
        case .iPhone6sPlus: return .retina_5_5
        case .iPhoneSE: return .retina_4_0
        case .iPhone7: return .retina_4_7
        case .iPhone7Plus: return .retina_5_5
        case .iPhone8: return .retina_4_7
        case .iPhone8Plus: return .retina_5_5
        case .iPhoneX: return .superRetina_5_8
        case .iPadAir: return .retina_9_7
        case .iPadAir2: return .retina_9_7
        case .iPad5: return .retina_9_7
        case .iPad6: return .retina_9_7
        case .iPadMini2: return .retina_7_9
        case .iPadMini3: return .retina_7_9
        case .iPadMini4: return .retina_7_9
        case .iPadPro_9_7: return .retina_9_7
        case .iPadPro_12_9: return .retina_12_9
        case .iPadPro_12_9_gen2: return .retina_12_9
        case .iPadPro_10_5: return .retina_10_5
        case .simulator(let model): return model.screen
        case .unknown(_): return .unknown
        }
    }
    
    public var resolution: CGSize {
         return UIScreen.main.bounds.size
    }
}
