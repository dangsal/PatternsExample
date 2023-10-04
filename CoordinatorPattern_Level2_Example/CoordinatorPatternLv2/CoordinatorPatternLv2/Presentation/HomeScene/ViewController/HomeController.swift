//
//  ViewController.swift
//  CoordinatorPatternLv2
//
//  Created by 이성호 on 10/4/23.
//

import Combine
import UIKit

final class HomeController: UIViewController {
    
    // MARK: - ui component
    
    private let homeView: HomeView = HomeView()
    
    // MARK: - property
    
    private let viewModel: HomeViewModel
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - init
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cycle
    
    override func loadView() {
        super.loadView()
        self.view = self.homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindToViewModel()
        self.bindView()
    }
    
    // MARK: - func
    
    private func bindToViewModel() {
        let output = self.transformOutput()
        self.bindOutputToViewModel(output)
    }
    
    private func transformOutput() -> HomeViewModel.Output {
        let input = HomeViewModel.Input(didTapPlusButtonPublisher: self.homeView.didTapPlusButtonPublisher.eraseToAnyPublisher())
        return self.viewModel.transform(from: input)
    }
    
    private func bindOutputToViewModel(_ output: HomeViewModel.Output) {
        output.plusNumber
            .sink { [weak self] number in
                self?.homeView.updateNumber(number: number)
            }
            .store(in: &self.cancellable)
    }
    
    private func bindView() {
        self.homeView.didTapSettingPublisher
            .sink {
                print("Here")
            }
            .store(in: &self.cancellable)
    }
}

