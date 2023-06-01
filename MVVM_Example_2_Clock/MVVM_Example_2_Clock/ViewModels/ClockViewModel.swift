//
//  ClockViewModel.swift
//  MVVM_Example_2_Clock
//
//  Created by 이성호 on 2023/06/01.
//

import Foundation

final class ClockViewModel {
    //     수행될 동작을 담을 클로저 변수 생성 (어떠한 기능을 담는다)
    var didChangeTime: ((ClockViewModel) -> Void)?
    
}
