//
//  ViewController.swift
//  combine_textfield_tutorial
//
//  Created by 이성호 on 2023/06/05.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - ui component
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let checkPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("확인", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }

    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(self.passwordTextField)
        self.passwordTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        self.passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.view.addSubview(self.checkPasswordTextField)
        self.checkPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 50).isActive = true
        self.checkPasswordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.checkPasswordTextField.widthAnchor.constraint(equalTo: self.passwordTextField.widthAnchor, multiplier: 1).isActive = true
        self.checkPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.view.addSubview(self.nextButton)
        self.nextButton.topAnchor.constraint(equalTo: self.checkPasswordTextField.bottomAnchor, constant: 50).isActive = true
        self.nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.nextButton.widthAnchor.constraint(equalTo: self.passwordTextField.widthAnchor, multiplier: 1).isActive = true
        self.nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

