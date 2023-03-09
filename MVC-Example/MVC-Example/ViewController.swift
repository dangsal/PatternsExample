//
//  ViewController.swift
//  MVC-Example
//
//  Created by 이성호 on 2023/03/09.
//

import UIKit

class ViewController: UIViewController {
    
    var todoItems: [TodoItem] = []
    
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
    }

    private func setLayout() {
        view.addSubview(tableView)
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    private func setupDelegation() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setupData() {
        todoItems = [
            TodoItem(title: "MVC 패턴 공부하기",
                     isCompleted: false),
            TodoItem(title: "코드리뷰하기",
                     isCompleted: false),
            TodoItem(title: "애니또 코드 탐색",
                     isCompleted: true)
        ]
    }
    
    private func addTodoItem(withTitle title: String) {
        let newTodoItem = TodoItem(title: title, isCompleted: false)
        todoItems.append(newTodoItem)
        tableView.reloadData()
    }
    
    private func toggleTodoOtemCompletion(at index: Int) {
        todoItems[index].isCompleted = !todoItems[index].isCompleted
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoItemCell
        let todoItem = todoItems[indexPath.row]
        
        cell.configure(with: todoItem)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toggleTodoOtemCompletion(at: indexPath.row)
    }
}
