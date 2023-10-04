//
//  SettingView.swift
//  CoordinatorPatternLv2
//
//  Created by 이성호 on 10/4/23.
//

import Combine
import UIKit

final class SettingView: UIView {
    
    // MARK: - ui component
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "세팅 레이블 입니다."
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("닉네임변경", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - property
    
    lazy var buttonTapPublisher = self.button.tapPublisher
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.addSubview(self.titleLabel)
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(self.button)
        self.button.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 68).isActive = true
    }
    
    private func configureUI() {
        self.backgroundColor = .white
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SettingPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = SettingView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
