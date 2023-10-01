//
//  CoordinatorFinishDelegate.swift
//  CoordinatorPattern_Example
//
//  Created by LeeSungHo on 10/1/23.
//

import Foundation

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
