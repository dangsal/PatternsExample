//
//  File.swift
//  MVC-Example
//
//  Created by 이성호 on 2023/03/09.
//

import UIKit

class TodoItemCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with todoItem: TodoItem) {
        self.textLabel?.text = todoItem.title
        self.accessoryType = todoItem.isCompleted ? .checkmark : .none
    }
}
