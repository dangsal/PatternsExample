//
//  ViewController.swift
//  MVP_Example_2
//
//  Created by 이성호 on 2023/05/17.
//

import UIKit

protocol UserViewDelegate: AnyObject {
    func displayUserDetail(user: User)
    func displayError(message: String)
}

final class UserViewController: UIViewController, UserViewDelegate {
    
    // MARK: - ui component
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let ageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let upButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1 올리기", for: .normal)
        return button
    }()
    
    // MARK: - property
    
    private let userPresenter = UserPresenter(userService: UserService())
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupButtonAction()
        self.setupPresenterDelegate()
        self.setupUserDetail()
    }

    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(self.nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.view.addSubview(self.ageLabel)
        self.ageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.ageLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10).isActive = true
        self.ageLabel.centerXAnchor.constraint(equalTo: self.nameLabel.centerXAnchor).isActive = true
        
        self.view.addSubview(self.upButton)
        self.upButton.translatesAutoresizingMaskIntoConstraints = false
        self.upButton.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor, constant: 10).isActive = true
        self.upButton.centerXAnchor.constraint(equalTo: self.ageLabel.centerXAnchor).isActive = true
    }
    
    private func setupButtonAction() {
        let didTapUpButton = UIAction { [weak self] _ in
            print("here")
        }
        self.upButton.addAction(didTapUpButton, for: .touchUpInside)
    }
    
    private func setupPresenterDelegate() {
        self.userPresenter.setViewDelegate(userViewDelegate: self)
    }
    
    private func setupUserDetail() {
        self.userPresenter.updateUserDetail()
    }
    
    func displayUserDetail(user: User) {
        self.nameLabel.text = user.name
        self.ageLabel.text = "\(user.age)"
    }
    
    func displayError(message: String) {
        // show Error Alert
    }
}

