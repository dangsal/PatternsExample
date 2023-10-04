//
//  SecondCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by 이성호 on 10/4/23.
//

import UIKit

final class SecondCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    weak var parentCoordinator: ViewCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SecondViewController()
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
