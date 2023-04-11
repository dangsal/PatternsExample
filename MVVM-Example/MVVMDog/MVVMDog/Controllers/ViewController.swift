//
//  ViewController.swift
//  MVVMDog
//
//  Created by 이성호 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    private let dogView: DogView = DogView()
    
    private let viewModel: DogViewModel = DogViewModel(dog: Dog(name: "hari",
                                                        birthDay: Date.now,
                                                        breed: .pomeranian,
                                                        imageName: "heart.fill"),
                                               calendar: Calendar(identifier: .gregorian))

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.updateDataInDogView()
    }

    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(dogView)
        self.dogView.translatesAutoresizingMaskIntoConstraints = false
        self.dogView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.dogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.dogView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.dogView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func updateDataInDogView() {
        viewModel.updateUI(dogView)
    }
}

