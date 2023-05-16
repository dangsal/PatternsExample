//
//  Model.swift
//  MVC-Example
//
//  Created by 이성호 on 2023/03/09.
//

import Foundation

struct TodoList {
    var items: [TodoItem] = []
    
    mutating func addItem(item: TodoItem) {
        items.append(item)
    }
    
    mutating func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    mutating func toggleCompleted(at index: Int) {
        items[index].isCompleted = !items[index].isCompleted
    }
}
