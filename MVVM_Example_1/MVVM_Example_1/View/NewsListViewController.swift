//
//  ViewController.swift
//  MVVM_Example_1
//
//  Created by 이성호 on 2023/05/19.
//

import UIKit

class NewsListViewController: UIViewController {
    
    // MARK: - ui compoenent
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - property
    
    private var articleListViewModel: ArticleListViewModel?

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupNavigationBar()
        self.fetchArticleList()
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.view.addSubview(self.tableView)
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func fetchArticleList() {
        WebService().fetchArticles { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articleListViewModel = ArticleListViewModel(articles: articles)
                self?.updateList()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func updateList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articleListViewModel = self.articleListViewModel else { return 0 }
        return articleListViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleTableViewCell
        
        guard let articleListViewModel = self.articleListViewModel else { return UITableViewCell() }
        let articleViewModel = articleListViewModel.articleAtIndex(indexPath.row)
        cell.configurelable(article: articleViewModel)
        return cell
    }
}

extension NewsListViewController: UITableViewDelegate {

}
