//
//  SettingViewController.swift
//  CoordinatorPatternLv2
//
//  Created by 이성호 on 10/4/23.
//

import Combine
import UIKit

final class SettingViewController: UIViewController {
    
    // MARK: - ui component
    
    private let settingView: SettingView = SettingView()
    
    // MARK: - property
    
    private let viewModel: SettingViewModel
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - init
    
    init(viewModel: SettingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cycle
    
    override func loadView() {
        super.loadView()
        self.view = self.settingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindToViewModel()
    }
    
    // MARK: - func
    
    private func bindToViewModel() {
        let output = self.transformOutput()
        self.bindOutputViewModel(output)
    }
    
    private func transformOutput() -> SettingViewModel.Output {
        let input = SettingViewModel.Input(didTapButton: self.settingView.buttonTapPublisher.eraseToAnyPublisher())
        return self.viewModel.transform(from: input)
    }
    
    private func bindOutputViewModel(_ output: SettingViewModel.Output) {
        output.didTapButtonPublisher
            .sink { [weak self] title in
                self?.pushChangeViewController(title: title)
            }
            .store(in: &self.cancellable)
    }
    
    private func pushChangeViewController(title: String) {
        self.navigationController?.pushViewController(ChangeNicknameViewController(titleVC: title), animated: true)
    }
}

