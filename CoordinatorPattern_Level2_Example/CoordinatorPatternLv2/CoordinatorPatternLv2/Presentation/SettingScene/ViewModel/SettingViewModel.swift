//
//  SettingViewModel.swift
//  CoordinatorPatternLv2
//
//  Created by 이성호 on 10/4/23.
//

import Combine
import Foundation

final class SettingViewModel {
    
    struct Input {
        let didTapButton: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let didTapButtonPublisher: AnyPublisher<String, Never>
    }
    
    // MARK: - property
    
    // MARK: - init
    
    // MARK: - func
    
    func transform(from input: Input) -> Output {
        let didTapButtonPublisher = input.didTapButton
            .map { return "닉네임변경" }
            .eraseToAnyPublisher()
        
        return Output(didTapButtonPublisher: didTapButtonPublisher)
    }
}
