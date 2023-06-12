//
//  ViewModel.swift
//  MVVM_Example_Combine_2
//
//  Created by 이성호 on 2023/06/12.
//

import Combine
import Foundation

final class ViewModel {
    
    @Published var userName: String = ""
    @Published var userPassword: String = ""
    @Published var userPasswordConfirm: String = ""
    
    var isVaildPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3($userName, $userPassword, $userPasswordConfirm)
            .map { userName, userPassword, userPasswordConfirm in
                return userName.count >= 1 && userPassword.count >= 6 && userPassword == userPasswordConfirm
            }
            .eraseToAnyPublisher()
    }
    
    func nextButtonDidTap() {
        print(userName, userPassword, userPasswordConfirm)
    }
}
