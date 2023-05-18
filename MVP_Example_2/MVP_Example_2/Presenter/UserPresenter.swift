//
//  UserPresenter.swift
//  MVP_Example_2
//
//  Created by 이성호 on 2023/05/17.
//

protocol UserPresenterProtocol: AnyObject {
    func updateUserDetail()
    func updateUserAge()
}
final class UserPresenter: UserPresenterProtocol {
    
    // MARK: - property
    
    private weak var userViewDelegate: UserViewDelegate?
    private let userService: UserService
    
    // MARK: - init
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    // MARK: - func
    
    func setViewDelegate(userViewDelegate: UserViewDelegate?) {
        self.userViewDelegate = userViewDelegate
    }
    
    func updateUserDetail() {
        userService.fetchUserDetails { [weak self] result in
            switch result {
            case .success(let user):
                self?.userViewDelegate?.displayUserDetail(user: user)
            case .failure(let error):
                self?.userViewDelegate?.displayError(message: error.localizedDescription)
            }
        }
    }
    
    func updateUserAge() {
        
    }
}
