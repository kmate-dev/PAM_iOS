//
//  ToDoItem.swift
//  PAM_iOS
//
//  Created by kmate on 13/10/2024.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    let id: Int
    let name: String
    var completed: Bool
}
