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
    
    // MARK: - init
    
    // MARK: - func
    
    // MARK: - api
    
    func fetchUsers() {
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data,
                  error == nil else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                self?.setUsers(users: users)
                DispatchQueue.main.async {
                    self?.delegate?.updateView()
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func setUsers(users: [User]) {
        self.users = users
    }
    
    func presentAlert(title: String, message: String) {
        self.delegate?.presentAlert(title: title, message: message)
    }
    
    func didTapUser(user: User) {
        presentAlert(title: user.name, message: "\(user.name) has an email of \(user.email) and a username of \(user.userName)")
    }
}
