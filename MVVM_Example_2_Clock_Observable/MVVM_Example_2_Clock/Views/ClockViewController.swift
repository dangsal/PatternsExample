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
//    1. 뷰모델 생성
    private var viewModel: ClockViewModel = ClockViewModel()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setTimer()
//        2. setBindings() 실행
        self.setBindings()
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
//    4. 매 초마다 시간을 업데이트 (checkTime 실행)
    private func setTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.viewModel.checkTime()
        }
    }
    
    private func setBindings() {
//        3. 정의해 둔 bind 메서드를 통해서 text를 업데이트 한다.
        viewModel.observableTime.bind { [weak self] time in
            self?.observableTimeLabel.text = time
        }
    }
}

