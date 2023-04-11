//
//  Dog.swift
//  MVVMDog
//
//  Created by 이성호 on 2023/04/11.
//

import Foundation

struct Dog {
    enum Breed {
        case maltese
        case pomeranian
        case pug
        case poodle
    }
    
    let name: String
    let birthDay: Date
    let breed: Breed
    let imageName: String
}
