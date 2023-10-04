//
//  Coordinator.swift
//  CoordinatorPattern_Example
//
//  Created by 이성호 on 10/4/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}
