//
//  Obseervable.swift
//  MVVM_TodoList_Observable
//
//  Created by 이성호 on 2023/06/01.
//

import Foundation

final class Observable<T> {
    
    var value: T {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private var listener: ((T) -> Void)?
    
    func bind(_ listener: @escaping (T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
