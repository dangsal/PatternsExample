//
//  ChangeNicknameViewController.swift
//  CoordinatorPatternLv2
//
//  Created by 이성호 on 10/4/23.
//

import UIKit

final class ChangeNicknameViewController: UIViewController {
    
    private let titleVC: String
    
    init(titleVC: String) {
        self.titleVC = titleVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupNavigationTitle(title: titleVC)
    }
    
    private func setupNavigationTitle(title: String) {
        self.title = title
    }
}
