//
//  Clock.swift
//  MVVM_Example_2_Clock
//
//  Created by 이성호 on 2023/06/01.
//

import Foundation

final class Clock {
    static var currentTime: (() -> String) = {
        let today = Date()
        
        let hours = Calendar.current.component(.hour, from: today)
        let minutes = Calendar.current.component(.minute, from: today)
        let seconds = Calendar.current.component(.second, from: today)
        
        let minString = String(format: "%02d", minutes)
        let secString = String(format: "$02d", seconds)
        
        return "\(hours):\(minString):\(secString)"
    }
}
