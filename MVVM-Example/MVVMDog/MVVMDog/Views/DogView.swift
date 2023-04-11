//
//  File.swift
//  MVVMDog
//
//  Created by 이성호 on 2023/04/11.
//

import UIKit

class DogView: UIView {

    // MARK: - ui components
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let ageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let adoptionFeeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .brown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - property
    
    var imageName: String = "" {
        willSet {
            self.imageView.image = UIImage(systemName: newValue)
        }
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        self.setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func configureUI() {
        self.backgroundColor = .white
    }
    
    private func setupLayout() {
        self.addSubview(imageView)
        self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.804).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor).isActive = true
        
        self.addSubview(nameLabel)
        self.nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 30).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: 10).isActive = true
        
        self.addSubview(ageLabel)
        self.ageLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20).isActive = true
        self.ageLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor).isActive = true
        
        self.addSubview(adoptionFeeLabel)
        self.adoptionFeeLabel.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor, constant: 20).isActive = true
        self.adoptionFeeLabel.leadingAnchor.constraint(equalTo: self.ageLabel.leadingAnchor).isActive = true
        
    }
}
