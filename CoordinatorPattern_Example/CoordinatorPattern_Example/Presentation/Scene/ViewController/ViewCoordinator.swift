//
//  ViewCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by 이성호 on 10/4/23.
//

import UIKit

final class ViewCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ViewController()
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushSecondViewController() {
        let secondCoordinator = SecondCoordinator(navigationController: self.navigationController)
        secondCoordinator.parentCoordinator = self
        self.childCoordinator.append(secondCoordinator)
        secondCoordinator.start()
    }
}
