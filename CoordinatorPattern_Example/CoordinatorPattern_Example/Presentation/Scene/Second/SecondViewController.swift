//
//  SecondViewController.swift
//  CoordinatorPattern_Example
//
//  Created by LeeSungHo on 10/1/23.
//

import UIKit

final class SecondViewController: UIViewController {
    
    // MARK: - property
    
    weak var coordinator: SecondCoordinator?
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationController()
        self.configureUI()
    }
    
    private func setupNavigationController() {
        self.title = "두번째 뷰"
    }
    
    private func configureUI() {
        self.view.backgroundColor = .white
    }
}
