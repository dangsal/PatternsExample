//
//  ViewController.swift
//  MVVM_TodoList_Observable
//
//  Created by 이성호 on 2023/06/01.
//

import UIKit

final class TodoViewController: UIViewController {
    
    // MARK: - ui component
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TodoItemCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.placeholder = " 할 일 추가하기"
        return textField
    }()
    // MARK: - property
    
    private let todoViewModel: TodoViewModel = TodoViewModel()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupDelegation()
        self.setupNavigationBar()
        self.setupBindings()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(self.tableView)
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.tableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        self.view.addSubview(self.textField)
        self.textField.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 50).isActive = true
        self.textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupDelegation() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        let navigationItem = navigationController?.topViewController?.navigationItem
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodoItem))
        navigationItem?.rightBarButtonItem = addButton
    }
    
    private func setupBindings() {
        self.todoViewModel.todoItems.bind { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - selector

    @objc
    private func addTodoItem() {
        guard let title = self.textField.text, !title.isEmpty else { return }
        
        self.todoViewModel.addTodoItem(title: title)
        self.textField.text = ""
    }
}

extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoViewModel.todoItems.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoItemCell
        let item = todoViewModel.todoItems.value[indexPath.row]
        
        cell.configure(with: item)
        return cell
    }
}

extension TodoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.todoViewModel.toggleTodoItem(index: indexPath.row)
    }
}
