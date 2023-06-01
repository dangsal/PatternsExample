//
//  ClockViewModel.swift
//  MVVM_Example_2_Clock
//
//  Created by 이성호 on 2023/06/01.
//

import Foundation

final class ClockViewModel {
    
//    0. 수행될 동작을 담을 클로저 변수 생성 (어떠한 기능을 담는다)
    var didChangeTime: ((ClockViewModel) -> Void)?
    
//    4-1. closureTime 변수 생성
    var closureTime: String {
//        4-2. checkTime에서 시간을 closureTime에 저장할 때마다 didSet호출, 어떠한 동작 (didChangeTime) 이 실행된다
        didSet {
            didChangeTime?(self)
        }
    }
    
    init() {
        closureTime = Clock.currentTime()
    }
    
//    4. 매 초마다 호출되면서 closureTime에 시간을 담아 준다.
    func checkTime() {
        self.closureTime = Clock.currentTime()
    }
}
