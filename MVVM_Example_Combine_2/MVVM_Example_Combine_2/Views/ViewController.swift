//
//  ViewController.swift
//  MVVM_Example_Combine_2
//
//  Created by 이성호 on 2023/06/12.
//

import Combine
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
        button.isEnabled = false
        button.backgroundColor = button.isEnabled ? .systemOrange : .systemGray
        return button
    }()
    
    // MARK: - property
    
    private var viewModel: ViewModel?
    private var subscriptions = Set<AnyCancellable>()

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupViewModel()
        self.setupAction()
        self.setupBindings()
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
    
    private func setupViewModel() {
        self.viewModel = ViewModel()
    }
    
    private func setupAction() {
        self.userNameTextField.addTarget(self, action: #selector(userNameTextFieldDidChange(_:)), for: .editingChanged)
        self.userPasswordTextField.addTarget(self, action: #selector(userPasswordTextFieldDidChange(_:)), for: .editingChanged)
        self.userPasswordConfirmTextField.addTarget(self, action: #selector(userPasswordConfirmTextFieldDidChange(_:)), for: .editingChanged)
        self.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    private func setupBindings() {
        self.viewModel?.isVaildPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] isVaild in
                self?.nextButton.backgroundColor = isVaild ? .systemOrange : .systemGray
                self?.nextButton.isEnabled = isVaild
                
            })
            .store(in: &subscriptions)
        
        self.viewModel?.buttonTapPublisher
            .sink { [weak self] _ in
                self?.buttonDidTap()
            }
            .store(in: &subscriptions)
    }
    
    private func buttonDidTap() {
        self.viewModel?.nextButtonDidTap()
    }

    // MARK: - selector
    
    @objc
    private func userNameTextFieldDidChange(_ textField: UITextField) {
        self.viewModel?.userName = textField.text ?? ""
    }
    
    @objc
    private func userPasswordTextFieldDidChange(_ textField: UITextField) {
        self.viewModel?.userPassword = textField.text ?? ""
    }
    
    @objc
    private func userPasswordConfirmTextFieldDidChange(_ textField: UITextField) {
        self.viewModel?.userPasswordConfirm = textField.text ?? ""
    }
    
    @objc
    private func nextButtonDidTap() {
        self.viewModel?.buttonTapPublisher.send()
    }
}

