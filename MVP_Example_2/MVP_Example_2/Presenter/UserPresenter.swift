//
//  UserPresenter.swift
//  MVP_Example_2
//
//  Created by 이성호 on 2023/05/17.
//

import Foundation

protocol UserPresenterDelegate: AnyObject {
    func setUsers(users: [User])
    func presentAlert(title: String, message: String)
}

final class UserPresenter: UserPresenterDelegate {
    
    // MARK: - property
    
    weak var delegate: UserViewDelegate?
    var users: [User] = []
    private let userService: UserServiceProtocol
    
    // MARK: - init
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    // MARK: - func
    
    func fetchUsers() {
        userService.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.setUsers(users: users)
                DispatchQueue.main.async {
                    self?.delegate?.updateView()
                }
            case .failure(let error):
                self?.delegate?.presentAlert(title: "오류", message: error.localizedDescription)
            }
        }
    }
    
    func setUsers(users: [User]) {
        self.users = users
    }
    
    func presentAlert(title: String, message: String) {
        self.delegate?.presentAlert(title: title, message: message)
    }
    
    func didTapUser(user: User) {
        presentAlert(title: user.name, message: "이름은 \(user.name) 이고 이메일은:\(user.email) \n 닉네임은 \(user.userName)입니다")
    }
}
