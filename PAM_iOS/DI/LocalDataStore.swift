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
