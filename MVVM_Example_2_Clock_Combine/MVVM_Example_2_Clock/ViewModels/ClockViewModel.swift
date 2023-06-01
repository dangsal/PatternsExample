//
//  ClockViewModel.swift
//  MVVM_Example_2_Clock
//
//  Created by 이성호 on 2023/06/01.
//

import Foundation
import Combine

final class ClockViewModel {
    
    @Published var combineTime: String = "Combine"
    
    func checkTime() {
        combineTime = Clock.currentTime()
    }
}
