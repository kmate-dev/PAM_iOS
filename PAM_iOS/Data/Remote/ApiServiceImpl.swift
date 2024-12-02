//
//  ApiServiceImpl.swift
//  PAM_iOS
//
//  Created by kmate on 02/12/2024.
//

import Foundation
import Alamofire

class ApiServiceImpl: ApiService {
    private let baseUrl = "https://dummyjson.com"
    private let decoder = JSONDecoder()
    
    func getToDoItems() async throws -> [ToDoItem] {
        let url = "\(baseUrl)/todos"
        
        let responseData: DummyJsonItems = try await withCheckedThrowingContinuation { continuation in
            AF.request(url)
                .validate()
                .responseDecodable(of: DummyJsonItems.self, decoder: decoder) { response in
                
                    switch response.result {
                    case .success(let result):
                        continuation.resume(returning: result)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                }
            }
        }
        let toDoItems = responseData.todos.map { remoteItem in
            ToDoItem(id: remoteItem.id, name: remoteItem.todo, completed: remoteItem.completed)
        }
        return toDoItems
    }
    
    func getToDoItem(itemId: Int) async throws -> ToDoItem {
        let url = "\(baseUrl)/todos/\(itemId)"
        
        let responseData: DummyJsonToDoItem = try await withCheckedThrowingContinuation { continuation in
            AF.request(url)
                .validate()
                .responseDecodable(of: DummyJsonToDoItem.self, decoder: decoder) { response in
                    debugPrint(response)
                    switch response.result {
                    case .success(let result):
                        continuation.resume(returning: result)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
        return ToDoItem(id: responseData.id, name: responseData.todo, completed: responseData.completed)
    }
}
