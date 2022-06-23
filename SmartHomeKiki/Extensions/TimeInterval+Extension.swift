//
//  TimeInterval+Extension.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/23/22.
//

import Foundation

extension TimeInterval {
    private var milliseconds: Int {
        return Int((truncatingRemainder(dividingBy: 1)) * 1000)
    }

    private var seconds: Int {
        return Int(self) % 60
    }

    private var minutes: Int {
        return (Int(self) / 60 ) % 60
    }

    private var hours: Int {
        return Int(self) / 3600
    }
    
    func toString() -> String {
        if hours > 0 {
            return String(format: "%0.2d:%0.2d:%0.2d", hours,minutes,seconds)
        } else if minutes > 0 {
            return String(format: "%0.2d:%0.2d", minutes,seconds)
        } else {
            return String(format: "%0.2d", seconds)
        }
    }
}
