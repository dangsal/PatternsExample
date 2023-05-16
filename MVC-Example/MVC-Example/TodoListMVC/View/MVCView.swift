//
//  File.swift
//  MVC-Example
//
//  Created by 이성호 on 2023/03/09.
//

import UIKit

protocol MVCViewDelegate: AnyObject {
    func addButtonDidTap()
}

final class MVCView: UIView {
    
    // MARK: - ui component
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TodoItemCell.self,
                           forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    // MARK: - property
    
    private weak var delegate: MVCViewDelegate?
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setLayout() {
        self.addSubview(tableView)
        tableView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func configureDelegate(_ delegate: MVCViewDelegate & UITableViewDelegate & UITableViewDataSource) {
        self.delegate = delegate
        self.tableView.delegate = delegate
        self.tableView.dataSource = delegate
    }
    
    func configureNavigationBar(_ navigationController: UINavigationController) {
        let navigationItem = navigationController.topViewController?.navigationItem
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodoItem))
        navigationItem?.rightBarButtonItem = addButton
    }
    
    func reloadTalbeView() {
        self.tableView.reloadData()
    }
    
    // MARK: - selector
    
    @objc
    private func addTodoItem() {
        self.delegate?.addButtonDidTap()
    }
}
