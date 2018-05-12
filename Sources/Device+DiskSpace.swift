//
//  Device+DiskSpace.swift
//  SimpleDevice
//
//  Created by 刘栋 on 2018/5/11.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Foundation

extension Device {
    
    private static var rootURL = {
        return URL(fileURLWithPath: "/")
    }()
    
    /// The volume’s total capacity in bytes.
    public static var volumeTotalCapacity: Int? {
        do {
            let values = try Device.rootURL.resourceValues(forKeys: [.volumeTotalCapacityKey])
            return values.volumeTotalCapacity
        } catch {
            return nil
        }
    }
    
    /// The volume’s available capacity in bytes.
    public static var volumeAvailableCapacity: Int? {
        do {
            let values = try rootURL.resourceValues(forKeys: [.volumeAvailableCapacityKey])
            return values.volumeAvailableCapacity
        } catch {
            return nil
        }
    }
    
    /// The volume’s available capacity in bytes for storing important resources.
    public static var volumeAvailableCapacityForImportantUsage: Int64? {
        do {
            let values = try rootURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey])
            return values.volumeAvailableCapacityForImportantUsage
        } catch {
            return nil
        }
    }
    
    /// The volume’s available capacity in bytes for storing nonessential resources.
    public static var volumeAvailableCapacityForOpportunisticUsage: Int64? { //swiftlint:disable:this identifier_name
        do {
            let values = try rootURL.resourceValues(forKeys: [.volumeAvailableCapacityForOpportunisticUsageKey])
            return values.volumeAvailableCapacityForOpportunisticUsage
        } catch {
            return nil
        }
    }
    
    /// All volumes capacity information in bytes.
    public static var volumes: [URLResourceKey: Int64]? {
        do {
            let values = try rootURL.resourceValues(forKeys: [
                .volumeAvailableCapacityForImportantUsageKey,
                .volumeAvailableCapacityKey,
                .volumeAvailableCapacityForOpportunisticUsageKey,
                .volumeTotalCapacityKey,
                ])
            return values.allValues.mapValues {
                if let int = $0 as? Int64 {
                    return int
                }
                if let int = $0 as? Int {
                    return Int64(int)
                }
                return 0
            }
        } catch {
            return nil
        }
    }
}
