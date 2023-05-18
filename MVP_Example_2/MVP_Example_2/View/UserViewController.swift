//
//  ViewController.swift
//  MVP_Example_2
//
//  Created by 이성호 on 2023/05/17.
//

import UIKit

protocol UserViewDelegate: AnyObject {
    func updateView()
    func presentAlert(title: String, message: String)
}

final class UserViewController: UIViewController, UserViewDelegate {
    
    // MARK: - ui component
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    
    // MARK: - property

    private let presenter: UserPresenter = UserPresenter(userService: UserService())
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupDelegate()
        self.fetchUsers()
    }

    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(tableView)
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func setupDelegate() {
        self.presenter.delegate = self
    }
    
    private func fetchUsers() {
        self.presenter.fetchUsers()
    }
    
    func updateView() {
        self.tableView.reloadData()
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        self.present(alert, animated: true)
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = presenter.users[indexPath.row].name
        return cell
    }
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.presenter.didTapUser(user: presenter.users[indexPath.row])
    }
}
