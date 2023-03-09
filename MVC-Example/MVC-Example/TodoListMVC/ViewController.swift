//
//  ViewController.swift
//  MVC-Example
//
//  Created by 이성호 on 2023/03/09.
//

import UIKit

class ViewController: UIViewController {
    
    var todoItems = Todolist()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TodoItemCell.self,
                           forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupDelegation()
        setLayout()
        setupNavBar()
    }

    private func setLayout() {
        view.addSubview(tableView)
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodoItem))
    }
    
    private func setupDelegation() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setupData() {
        todoItems.items = [
            TodoItem(title: "MVC 패턴 공부하기",
                     isCompleted: false),
            TodoItem(title: "코드리뷰하기",
                     isCompleted: false),
            TodoItem(title: "애니또 코드 탐색",
                     isCompleted: true)
        ]
    }
    
    @objc private func addTodoItem() {
        let newTodoItem = TodoItem(title: "추가되었다!", isCompleted: false)
        todoItems.addItem(item: newTodoItem)
        tableView.reloadData()
    }
    
    private func toggleTodoOtemCompletion(at index: Int) {
        todoItems.toggleCompleted(at: index)
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoItemCell
        let todoItem = todoItems.items[indexPath.row]
        
        cell.configure(with: todoItem)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toggleTodoOtemCompletion(at: indexPath.row)
    }
}
