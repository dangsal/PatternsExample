//
//  HomeViewModel.swift
//  CoordinatorPatternLv2
//
//  Created by 이성호 on 10/4/23.
//

import Combine
import Foundation

final class HomeViewModel {
    
    struct Input {
        let didTapPlusButtonPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
        let plusNumber: AnyPublisher<Int, Never>
    }
    
    // MARK: - property
    
    // MARK: - init
    
    // MARK: - func
    
    func transform(from input: HomeViewModel.Input) -> HomeViewModel.Output {
        
        let plusNumberPublisher = input.didTapPlusButtonPublisher
            .map { $0 + 1 }
            .eraseToAnyPublisher()
        
        return Output(plusNumber: plusNumberPublisher)
    }
}
