//
//  ClockViewModel.swift
//  MVVM_Example_2_Clock
//
//  Created by 이성호 on 2023/06/01.
//

import Foundation

final class ClockViewModel {
    
    var observableTime: Observable<String> = Observable("Observable")
    
    init() {
        observableTime.value = Clock.currentTime()
    }
    
//    5. value를 호출하여 시간이 업데이트 되므로 didSet실행
    func checkTime() {
        observableTime.value = Clock.currentTime()
    }
}
