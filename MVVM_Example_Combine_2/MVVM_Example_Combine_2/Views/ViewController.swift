//
//  ViewController.swift
//  MVVM_Example_Combine_2
//
//  Created by 이성호 on 2023/06/12.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - ui component
    
    private let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "이름을 입력하세요."
        return textField
    }()
    
    private let userPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "비밀번호를 입력하세요."
        return textField
    }()
    
    private let userPasswordConfirmTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "비밀번호를 다시 입력하세요."
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("확인입니다.", for: .normal)
        button.backgroundColor = .systemOrange
        return button
    }()

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(self.userNameTextField)
        self.userNameTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        self.userNameTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.userNameTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.userNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.view.addSubview(self.userPasswordTextField)
        self.userPasswordTextField.topAnchor.constraint(equalTo: self.userNameTextField.bottomAnchor, constant: 50).isActive = true
        self.userPasswordTextField.leadingAnchor.constraint(equalTo: self.userNameTextField.leadingAnchor).isActive = true
        self.userPasswordTextField.trailingAnchor.constraint(equalTo: self.userNameTextField.trailingAnchor).isActive = true
        self.userPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.view.addSubview(self.userPasswordConfirmTextField)
        self.userPasswordConfirmTextField.topAnchor.constraint(equalTo: self.userPasswordTextField.bottomAnchor, constant: 50).isActive = true
        self.userPasswordConfirmTextField.leadingAnchor.constraint(equalTo: self.userPasswordTextField.leadingAnchor).isActive = true
        self.userPasswordConfirmTextField.trailingAnchor.constraint(equalTo: self.userPasswordTextField.trailingAnchor).isActive = true
        self.userPasswordConfirmTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.view.addSubview(self.nextButton)
        self.nextButton.topAnchor.constraint(equalTo: self.userPasswordConfirmTextField.bottomAnchor, constant: 50).isActive = true
        self.nextButton.leadingAnchor.constraint(equalTo: self.userPasswordConfirmTextField.leadingAnchor).isActive = true
        self.nextButton.trailingAnchor.constraint(equalTo: self.userPasswordConfirmTextField.trailingAnchor).isActive = true
        self.nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}

