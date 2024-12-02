//
//  ApiService.swift
//  PAM_iOS
//
//  Created by kmate on 02/12/2024.
//

import Foundation

protocol ApiService {
    func getToDoItems() async throws -> [ToDoItem]
    func getToDoItem(itemId: Int) async throws -> ToDoItem
}
