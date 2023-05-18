//
//  User.swift
//  MVP_Example_2
//
//  Created by 이성호 on 2023/05/17.
//

struct User: Codable {
    let name: String
    let email: String
    let userName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case userName = "username"
    }
}
