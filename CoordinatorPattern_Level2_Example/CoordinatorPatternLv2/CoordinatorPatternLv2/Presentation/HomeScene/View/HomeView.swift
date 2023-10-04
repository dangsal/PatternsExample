//
//  HomeView.swift
//  CoordinatorPatternLv2
//
//  Created by 이성호 on 10/4/23.
//

import Combine
import UIKit

final class HomeView: UIView {
    
    // MARK: - ui component
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("더하기 1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let settingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - property
    
    let didTapPlusButtonPublisher = PassthroughSubject<Int, Never>()
    lazy var didTapSettingPublisher = self.settingButton.tapPublisher
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureUI()
        self.setupAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.addSubview(self.settingButton)
        self.settingButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        self.settingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        self.settingButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.settingButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(self.numberLabel)
        self.numberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.numberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(self.plusButton)
        self.plusButton.centerXAnchor.constraint(equalTo: self.numberLabel.centerXAnchor).isActive = true
        self.plusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        self.plusButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.plusButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setupAction() {
        let action = UIAction { [weak self] _ in
            self?.didTapPlusButtonPublisher.send(self?.labelText() ?? 1)
        }
        self.plusButton.addAction(action, for: .touchUpInside)
    }
    
    private func configureUI() {
        self.backgroundColor = .white
    }
    
    private func labelText() -> Int {
        return Int(self.numberLabel.text!)!
    }
    
    func updateNumber(number: Int) {
        self.numberLabel.text = "\(number)"
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct Preview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = HomeView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
