//
//  ToDoItemViewModel.swift
//  PAM_iOS
//
//  Created by kmate on 04/11/2024.
//

import Foundation

class ToDoItemViewModel: ObservableObject {
    private let apiService: ApiService = Injection.resolve()
    private let localDataStore: LocalDataStore = Injection.resolve()
    @Published var todoItem: ToDoItem? = nil
    
    init(todoItemId: Int) {
        if (todoItemId < 31) {
            Task {
                let item = try await apiService.getToDoItem(itemId: todoItemId)
                DispatchQueue.main.async {
                    self.todoItem = item
                }
            }
        } else {
            let item = localDataStore.getToDoItem(itemId: todoItemId)
            self.todoItem = item
        }
    }
}
