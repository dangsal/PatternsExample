//
//  DogViewModel.swift
//  MVVMDog
//
//  Created by 이성호 on 2023/04/11.
//

import UIKit

struct DogViewModel {
    let dog: Dog
    let calendar: Calendar
    
    var name: String {
        return dog.name
    }
    
    var imageName: String {
        return dog.imageName
    }
    
    var ageText: String {
        let today = calendar.startOfDay(for: Date())
        let birthday = calendar.startOfDay(for: dog.birthDay)
        let components = calendar.dateComponents([.year], from: birthday, to: today)
        let age = components.year == nil ? 0 : components.year!
        return "\(age) 살 입니다."
    }
    
    var adoptionFeeText: String {
        switch dog.breed {
        case .maltese:
            return "만원"
        case .pomeranian:
            return "2만원"
        case .poodle:
            return "3만원"
        case .pug:
            return "4만원"
        }
    }
}

extension DogViewModel {
    func updateUI(_ view: DogView) {
        view.nameLabel.text = name
        view.imageName = imageName
        view.ageLabel.text = ageText
        view.adoptionFeeLabel.text = adoptionFeeText
    }
}
