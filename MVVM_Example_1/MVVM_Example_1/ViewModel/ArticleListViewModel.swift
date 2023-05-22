//
//  ArticleListViewModel.swift
//  MVVM_Example_1
//
//  Created by 이성호 on 2023/05/19.
//

import Foundation

struct ArticleListViewModel {
    
    let articles: [Article]
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    
    private let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String? {
        return self.article.title
    }
    
    var description: String? {
        return self.article.description
    }
}
