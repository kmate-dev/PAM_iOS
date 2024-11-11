//
//  ToDoItemViewModel.swift
//  PAM_iOS
//
//  Created by kmate on 04/11/2024.
//

import Foundation

class ToDoItemViewModel: ObservableObject {
    private let localDataStore: LocalDataStore = Injection.resolve()
    @Published var todoItem: ToDoItem? = nil
    
    init(todoItemId: Int) {
        let item = localDataStore.getToDoItem(itemId: todoItemId)
        self.todoItem = item
    }
}
