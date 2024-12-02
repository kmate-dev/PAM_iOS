//
//  RemoteModels.swift
//  PAM_iOS
//
//  Created by kmate on 02/12/2024.
//

import Foundation

struct DummyJsonToDoItem: Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}

struct DummyJsonItems: Codable {
    let todos: [DummyJsonToDoItem]
}
