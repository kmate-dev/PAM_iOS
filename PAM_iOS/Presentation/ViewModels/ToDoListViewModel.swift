//
//  ToDoViewModel.swift
//  PAM_iOS
//
//  Created by kmate on 13/10/2024.
//

import Foundation

class ToDoListViewModel: ObservableObject {
    private let apiService: ApiService = Injection.resolve()
    private let localDataStore: LocalDataStore = Injection.resolve()
    @Published var todosList: [ToDoItem] = []
    @Published var loading: Bool = false
    
    init() {
        //Fake fetch from DB
        todosList = localDataStore.getToDoItems()
    }
    
    func loadRemoteItems() async {
        do {
            let items = try await apiService.getToDoItems()
            
            DispatchQueue.main.async {
                self.todosList += items
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func addToDoItem(name: String) {
        loading = true
        let newItem = ToDoItem(id: getNextId(), name: name, completed: false)
        
        DispatchQueue.main.asyncAfter( deadline: .now() + 0.5) {
            self.todosList.append(newItem)
            self.localDataStore.updateToDoItems(items: self.todosList)
            self.loading = false
        }
    }
    
    func completeItem(id: Int) {
        if let index = todosList.firstIndex(where: { $0.id == id }) {
            todosList[index].completed.toggle()
        }
        localDataStore.updateToDoItems(items: todosList)
    }
    
    private func getNextId() -> Int {
        if let itemWithHighestId = todosList.max(by: { $0.id < $1.id }) {
            return itemWithHighestId.id + 1
        } else {
            return 100 //Starting from > 30 to avoid local and network items mixing (dirty workaround)
        }
    }
}
