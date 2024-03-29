//
//  ViewController.swift
//  MVVM_Example_2_Clock
//
//  Created by 이성호 on 2023/06/01.
//

import UIKit

final class ClockViewController: UIViewController {

    // MARK: - ui component
    
    private let closureLabel: UILabel = {
        let label = UILabel()
        label.text = "Closure"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    private let closureTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        return label
    }()
    private let observableLabel: UILabel = {
        let label = UILabel()
        label.text = "Observable"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    private let observableTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        return label
    }()
    private let combineLabel: UILabel = {
        let label = UILabel()
        label.text = "Combine"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    private let combineTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        return label
    }()
    
    // MARK: - property
    
//    1. 뷰 모델 생성
    private let viewModel = ClockViewModel()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
//        3-1. setBindings() 실행
        self.setBindings()
        self.setTimer()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(closureLabel)
        self.closureLabel.translatesAutoresizingMaskIntoConstraints = false
        self.closureLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        self.closureLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(closureTimeLabel)
        self.closureTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.closureTimeLabel.topAnchor.constraint(equalTo: self.closureLabel.bottomAnchor, constant: 20).isActive = true
        self.closureTimeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(observableLabel)
        self.observableLabel.translatesAutoresizingMaskIntoConstraints = false
        self.observableLabel.topAnchor.constraint(equalTo: self.closureTimeLabel.bottomAnchor, constant: 50).isActive = true
        self.observableLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(observableTimeLabel)
        self.observableTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.observableTimeLabel.topAnchor.constraint(equalTo: self.observableLabel.bottomAnchor, constant: 20).isActive = true
        self.observableTimeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(combineLabel)
        self.combineLabel.translatesAutoresizingMaskIntoConstraints = false
        self.combineLabel.topAnchor.constraint(equalTo: self.observableTimeLabel.bottomAnchor, constant: 50).isActive = true
        self.combineLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(combineTimeLabel)
        self.combineTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.combineTimeLabel.topAnchor.constraint(equalTo: self.combineLabel.bottomAnchor, constant: 20).isActive = true
        self.combineTimeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    private func setTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.viewModel.checkTime()
        }
    }
    
//    3. 어떠한 행동은 여기에 저장됨 (didChangeTime에 클로저의 동작을 담아 저장 시킨다.)
    private func setBindings() {
//        5. viewModel의 didChangeTime 클로저 를 정의 하고 실행한다.
        viewModel.didChangeTime = { [weak self] viewModel in
            self?.closureTimeLabel.text = viewModel.closureTime
        }
    }
}

