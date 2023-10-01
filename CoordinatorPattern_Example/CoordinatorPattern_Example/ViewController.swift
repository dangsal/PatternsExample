//
//  ViewController.swift
//  CoordinatorPattern_Example
//
//  Created by LeeSungHo on 9/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다음 뷰로 넘어가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationTitle()
        self.configureUI()
        self.setupLayout()
        self.setupAction()
    }
    
    // MARK: - func
    
    private func setupNavigationTitle() {
        self.title = "루트뷰"
    }
    
    private func configureUI() {
        self.view.backgroundColor = .white
    }
    
    private func setupLayout() {
        self.view.addSubview(self.nextButton)
        self.nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.nextButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.nextButton.widthAnchor.constraint(equalToConstant: 400).isActive = true
        self.nextButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setupAction() {
        let didTapNextButton = UIAction { [weak self] _ in
            self?.pushSecondeViewController()
        }
        self.nextButton.addAction(didTapNextButton, for: .touchUpInside)
    }
    
    private func pushSecondeViewController() {
        let viewController = SecondViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

