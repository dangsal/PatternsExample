//
//  UserService.swift
//  MVP_Example_2
//
//  Created by 이성호 on 2023/05/18.
//

import Foundation

protocol UserServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}

final class UserService: UserServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/users") else {
            completion(.failure(MyError.invaildURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(MyError.networkError))
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}


