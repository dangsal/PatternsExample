//
//  ViewController.swift
//  MVC-Example
//
//  Created by 이성호 on 2023/03/09.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - ui component
    
    private let mvcView: MVCView = MVCView()

    // MARK: - property
    
    private var todoItems = TodoList()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupDelegation()
        self.setupNavBar()
    }
    
    override func loadView() {
        self.view = self.mvcView
    }
    
    // MARK: - func
    
    private func setupNavBar() {
        guard let navigationController = self.navigationController else { return }
        self.mvcView.configureNavigationBar(navigationController)
    }
    
    private func setupDelegation() {
        self.mvcView.configureDelegate(self)
    }
    
    private func setupData() {
        self.todoItems.items = [
            TodoItem(title: "MVC 패턴 공부하기",
                     isCompleted: false),
            TodoItem(title: "코드리뷰하기",
                     isCompleted: false),
            TodoItem(title: "애니또 코드 탐색",
                     isCompleted: true)
        ]
    }
    
    private func toggleTodoItemCompletion(at index: Int) {
        self.todoItems.toggleCompleted(at: index)
        self.mvcView.reloadTalbeView()
    }
    
    private func addTodoItem() {
        let newTodoItem = TodoItem(title: "추가되었다!", isCompleted: false)
        self.todoItems.addItem(item: newTodoItem)
        self.mvcView.reloadTalbeView()
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoItems.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoItemCell
        let todoItem = self.todoItems.items[indexPath.row]
        
        cell.configure(with: todoItem)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.toggleTodoItemCompletion(at: indexPath.row)
    }
}

// MARK: - MVCDelegate

extension ViewController: MVCViewDelegate {
    func addButtonDidTap() {
        self.addTodoItem()
    }
}
