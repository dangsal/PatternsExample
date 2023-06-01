//
//  Observable.swift
//  MVVM_Example_2_Clock
//
//  Created by 이성호 on 2023/06/01.
//

import Foundation
//0. Observable 클래스 생성
class Observable<T> {
    
    var value: T? {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> (Void))?
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
