//
//  Device.swift
//  SimpleDevice
//
//  Created by 刘栋 on 2018/5/11.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Darwin

public enum Device: Equatable, Hashable {
    case iPod6
    
    case iPhone5s
    case iPhone6
    case iPhone6Plus
    case iPhone6s
    case iPhone6sPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    
    case iPad5
    case iPad6
    case iPadAir
    case iPadAir2
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadPro_9_7
    case iPadPro_10_5
    case iPadPro_12_9
    case iPadPro_12_9_gen2
    
    indirect case simulator(Device)
    
    case unknown(String)
    
    public init() {
        let identifier = Device.identifier
        self.init(identifier: identifier)
    }
    
    public init(identifier: String) {
        switch identifier {
        case "iPod7,1": self = .iPod6
        case "iPhone6,1", "iPhone6,2": self = .iPhone5s
        case "iPhone7,2": self = .iPhone6
        case "iPhone7,1": self = .iPhone6Plus
        case "iPhone8,1": self = .iPhone6s
        case "iPhone8,2": self = .iPhone6sPlus
        case "iPhone8,4": self = .iPhoneSE
        case "iPhone9,1", "iPhone9,3": self = .iPhone7
        case "iPhone9,2", "iPhone9,4": self = .iPhone7Plus
        case "iPhone10,1", "iPhone10,4": self = .iPhone8
        case "iPhone10,2", "iPhone10,5": self = .iPhone8Plus
        case "iPhone10,3", "iPhone10,6": self = .iPhoneX
        case "iPad4,1", "iPad4,2", "iPad4,3": self = .iPadAir
        case "iPad5,3", "iPad5,4": self = .iPadAir2
        case "iPad6,11", "iPad6,12": self = .iPad5
        case "iPad7,5", "iPad7,6": self = .iPad6
        case "iPad4,4", "iPad4,5", "iPad4,6": self = .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9": self = .iPadMini3
        case "iPad5,1", "iPad5,2": self = .iPadMini4
        case "iPad6,3", "iPad6,4": self = .iPadPro_9_7
        case "iPad6,7", "iPad6,8": self = .iPadPro_12_9
        case "iPad7,1", "iPad7,2": self = .iPadPro_12_9_gen2
        case "iPad7,3", "iPad7,4": self = .iPadPro_10_5
        case "i386", "x86_64": self = .simulator(Device(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "UNKONWN"))
        default: self = .unknown(identifier)
        }
    }
}

extension Device {
    
    public static var identifier: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        
        let identifier = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}

extension Device: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .iPod6: return "iPod Touch 6"
        case .iPhone5s: return "iPhone 5s"
        case .iPhone6: return "iPhone 6"
        case .iPhone6Plus: return "iPhone 6 Plus"
        case .iPhone6s: return "iPhone 6s"
        case .iPhone6sPlus: return "iPhone 6s Plus"
        case .iPhone7: return "iPhone 7"
        case .iPhone7Plus: return "iPhone 7 Plus"
        case .iPhoneSE: return "iPhone SE"
        case .iPhone8: return "iPhone 8"
        case .iPhone8Plus: return "iPhone 8 Plus"
        case .iPhoneX: return "iPhone X"
        case .iPadAir: return "iPad Air"
        case .iPadAir2: return "iPad Air 2"
        case .iPad5: return "iPad 5"
        case .iPad6: return "iPad 6"
        case .iPadMini2: return "iPad Mini 2"
        case .iPadMini3: return "iPad Mini 3"
        case .iPadMini4: return "iPad Mini 4"
        case .iPadPro_9_7: return "iPad Pro (9.7-inch)"
        case .iPadPro_12_9: return "iPad Pro (12.9-inch)"
        case .iPadPro_12_9_gen2: return "iPad Pro (12.9-inch) 2"
        case .iPadPro_10_5: return "iPad Pro (10.5-inch)"
        case .simulator(let model): return "Simulator (\(model))"
        case .unknown(let identifier): return identifier
        }
    }
}
