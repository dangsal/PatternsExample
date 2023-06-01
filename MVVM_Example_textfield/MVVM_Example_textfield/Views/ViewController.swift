//
//  ViewController.swift
//  MVVM_Example_textfield
//
//  Created by 이성호 on 2023/06/01.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - ui component
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름을 입력하세요."
        return label
    }()

    // MARK: - property
    
    private let viewModel: ViewModel = ViewModel()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupTextField()
        self.setBindings()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(self.nameTextField)
        self.nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.nameTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        self.nameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.nameTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.view.addSubview(self.nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 50).isActive = true
        self.nameLabel.centerXAnchor.constraint(equalTo: self.nameTextField.centerXAnchor).isActive = true
    }
    
    private func setupTextField() {
        self.nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func setBindings() {
        self.viewModel.name.bind { [weak self] name in
            self?.nameLabel.text = name
        }
    }
    
    // MARK: - selector
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        viewModel.name.value = textField.text ?? ""
    }
}


