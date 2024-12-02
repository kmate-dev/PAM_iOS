//
//  LocalDataStore.swift
//  PAM_iOS
//
//  Created by kmate on 10/11/2024.
//

import Foundation

protocol LocalDataStore {
    func updateToDoItems(items: [ToDoItem])
    func getToDoItems() -> [ToDoItem]
    func getToDoItem(itemId: Int) -> ToDoItem?
}

class LocalDataStoreImpl: LocalDataStore {
    private let toDoItemsListKey = "TODO_ITEMS_KEY"
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    func getToDoItems() -> [ToDoItem] {
        if let savedToDoItemsString = userDefaults.data(forKey: toDoItemsListKey),
           let savedToDoItems = try? JSONDecoder().decode([ToDoItem].self, from: savedToDoItemsString) {
            return savedToDoItems
        }
        return []
    }
    
    func updateToDoItems(items: [ToDoItem]) {
        if let encodedItems = try? JSONEncoder().encode(items) {
            userDefaults.set(encodedItems, forKey: toDoItemsListKey)
        }
    }
    
    func getToDoItem(itemId: Int) -> ToDoItem? {
        let toDoItems = getToDoItems()
        return toDoItems.first(where: { $0.id == itemId })
    }
}
