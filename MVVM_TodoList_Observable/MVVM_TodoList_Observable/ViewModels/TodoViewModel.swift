//
//  TodoViewModel.swift
//  MVVM_TodoList_Observable
//
//  Created by 이성호 on 2023/06/01.
//

import Foundation

final class TodoViewModel {
    var todoItems = Observable([TodoItem]())
    
    func addTodoItem(title: String) {
        let newItem = TodoItem(title: title, isCompleted: false)
        todoItems.value.append(newItem)
    }
    
    func toggleTodoItem(index: Int) {
        var items = todoItems.value
        items[index].isCompleted.toggle()
        todoItems.value = items
    }
}
