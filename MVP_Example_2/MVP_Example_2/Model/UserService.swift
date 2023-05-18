//
//  userService.swift
//  MVP_Example_2
//
//  Created by 이성호 on 2023/05/17.
//

final class UserService {
    
    func fetchUserDetails(completion: @escaping (Result<User, Error>) -> Void) {
        let user = User(name: "호야", age: 29)
        completion(.success(user))
    }
    
}
