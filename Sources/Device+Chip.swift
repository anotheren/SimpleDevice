//
//  Device+Chip.swift
//  SimpleDevice
//
//  Created by 刘栋 on 2018/5/11.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Foundation

extension Device {
    
    public enum Chip {
        case a7
        case a8
        case a8x
        case a9
        case a9x
        case a10
        case a10x
        case a11
        case unknown
    }
    
    public var chip: Chip {
        switch self {
        case .iPod6: return .a8
        case .iPhone5s: return .a7
        case .iPhone6: return .a8
        case .iPhone6Plus: return .a8
        case .iPhone6s: return .a9
        case .iPhone6sPlus: return .a9
        case .iPhoneSE: return .a9
        case .iPhone7: return .a10
        case .iPhone7Plus: return .a10
        case .iPhone8: return .a11
        case .iPhone8Plus: return .a11
        case .iPhoneX: return .a11
        case .iPadAir: return .a7
        case .iPadAir2: return .a8x
        case .iPad5: return .a9
        case .iPad6: return .a10
        case .iPadMini2: return .a7
        case .iPadMini3: return .a7
        case .iPadMini4: return .a8
        case .iPadPro_9_7: return .a9x
        case .iPadPro_12_9: return .a9x
        case .iPadPro_12_9_gen2: return .a10x
        case .iPadPro_10_5: return .a10x
        case .simulator(let model): return model.chip
        case .unknown(_): return .unknown
        }
    }
    
    public var ram: Int {
        switch self {
        case .iPod6: return 1
        case .iPhone5s: return 1
        case .iPhone6: return 1
        case .iPhone6Plus: return 1
        case .iPhone6s: return 2
        case .iPhone6sPlus: return 2
        case .iPhoneSE: return 2
        case .iPhone7: return 2
        case .iPhone7Plus: return 3
        case .iPhone8: return 2
        case .iPhone8Plus: return 3
        case .iPhoneX: return 3
        case .iPadAir: return 1
        case .iPadAir2: return 2
        case .iPad5: return 2
        case .iPad6: return 2
        case .iPadMini2: return 1
        case .iPadMini3: return 1
        case .iPadMini4: return 2
        case .iPadPro_9_7: return 2
        case .iPadPro_12_9: return 4
        case .iPadPro_12_9_gen2: return 4
        case .iPadPro_10_5: return 4
        case .simulator(let model): return model.ram
        case .unknown(_): return 2
        }
    }
}
