//
//  Device+UIDevice.swift
//  SimpleDevice
//
//  Created by 刘栋 on 2018/5/11.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import UIKit

extension Device {
    
    /// The name identifying the device (e.g. "LD's iPhone").
    public static var name: String {
        return UIDevice.current.name
    }
    
    /// The name of the operating system running on the device represented by the receiver (e.g. "iOS" or "tvOS").
    public static var systemName: String {
        return UIDevice.current.systemName
    }
    
    /// The current version of the operating system (e.g. 11.3).
    public static var systemVersion: String {
        return UIDevice.current.systemVersion
    }
    
    /// The model of the device (e.g. "iPhone" or "iPad").
    public static var model: String {
        return UIDevice.current.model
    }
    
    /// The model of the device as a localized string.
    public static var localizedModel: String {
        return UIDevice.current.localizedModel
    }
}

extension Device {
    
    public enum BatteryState: CustomStringConvertible, Equatable {
        /// The device is plugged into power and the battery is 100% charged or the device is the iOS Simulator.
        case full
        /// The device is plugged into power and the battery is less than 100% charged.
        /// The associated value is in percent (0-100).
        case charging(Int)
        /// The device is not plugged into power; the battery is discharging.
        /// The associated value is in percent (0-100).
        case unplugged(Int)
        
        init() {
            let wasBatteryMonitoringEnabled = UIDevice.current.isBatteryMonitoringEnabled
            UIDevice.current.isBatteryMonitoringEnabled = true
            let batteryLevel = Int(round(UIDevice.current.batteryLevel * 100)) // round() is actually not needed anymore since -[batteryLevel] seems to always return a two-digit precision number
            // but maybe that changes in the future.
            switch UIDevice.current.batteryState {
            case .charging: self = .charging(batteryLevel)
            case .full: self = .full
            case .unplugged:self = .unplugged(batteryLevel)
            case .unknown: self = .full // Should never happen since `batteryMonitoring` is enabled.
            }
            UIDevice.current.isBatteryMonitoringEnabled = wasBatteryMonitoringEnabled
        }
        
        /// The user enabled Low Power mode
        public var lowPowerMode: Bool {
            if #available(iOS 9.0, *) {
                return ProcessInfo.processInfo.isLowPowerModeEnabled
            } else {
                return false
            }
        }
        
        /// Provides a textual representation of the battery state.
        /// Examples:
        /// ```
        /// Battery level: 90%, device is plugged in.
        /// Battery level: 100 % (Full), device is plugged in.
        /// Battery level: \(batteryLevel)%, device is unplugged.
        /// ```
        public var description: String {
            switch self {
            case .charging(let batteryLevel): return "Battery level: \(batteryLevel)%, device is plugged in."
            case .full: return "Battery level: 100 % (Full), device is plugged in."
            case .unplugged(let batteryLevel): return "Battery level: \(batteryLevel)%, device is unplugged."
            }
        }
        
    }
    
    /// The state of the battery
    public static var batteryState: BatteryState {
        return BatteryState()
    }
    
    /// Battery level ranges from 0 (fully discharged) to 100 (100% charged).
    public static var batteryLevel: Int {
        switch BatteryState() {
        case .charging(let value): return value
        case .full: return 100
        case .unplugged(let value): return value
        }
    }
    
}

extension Device.BatteryState: Comparable {
    
    /// Compares two battery states.
    ///
    /// - parameter lhs: A battery state.
    /// - parameter rhs: Another battery state.
    ///
    /// - returns: `true` if rhs is `.Full`, `false` when lhs is `.Full` otherwise their battery level is compared.
    public static func < (lhs: Device.BatteryState, rhs: Device.BatteryState) -> Bool {
        switch (lhs, rhs) {
        case (.full, _): return false // return false (even if both are `.Full` -> they are equal)
        case (_, .full): return true // lhs is *not* `.Full`, rhs is
        case (.charging(let lhsLevel), .charging(let rhsLevel)): return lhsLevel < rhsLevel
        case (.charging(let lhsLevel), .unplugged(let rhsLevel)): return lhsLevel < rhsLevel
        case (.unplugged(let lhsLevel), .charging(let rhsLevel)): return lhsLevel < rhsLevel
        case (.unplugged(let lhsLevel), .unplugged(let rhsLevel)): return lhsLevel < rhsLevel
        default: return false // compiler won't compile without it, though it cannot happen
        }
    }
}
