//
//  ToDoViewModel.swift
//  PAM_iOS
//
//  Created by kmate on 13/10/2024.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var todosList: [ToDoItem] = []
    @Published var loading: Bool = false
    
    private var itemId = 0
    
    init() {
        //Fake fetch from DB
        todosList.append(contentsOf: [
            ToDoItem(id: getNextId(), name: "Prepare Android Example", completed: false),
            ToDoItem(id: getNextId(), name: "Prepare iOS example", completed: false)
        ])
    }
    
    func addToDoItem(name: String) {
        loading = true
        let newItem = ToDoItem(id: getNextId(), name: name, completed: false)
        
        DispatchQueue.main.asyncAfter( deadline: .now() + 0.5) {
            self.todosList.append(newItem)
            self.loading = false
        }
    }
    
    func completeItem(id: Int) {
        if let index = todosList.firstIndex(where: { $0.id == id }) {
            todosList[index].completed.toggle()
        }
    }
    
    private func getNextId() -> Int {
        let nextIndex = itemId
        itemId += 1
        return nextIndex
    }
}
