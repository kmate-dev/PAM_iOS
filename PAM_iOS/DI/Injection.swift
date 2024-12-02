//
//  Injection.swift
//  PAM_iOS
//
//  Created by kmate on 10/11/2024.
//

import Foundation
import Swinject

public class Injection {
    private let container = Container()
    
    private init() {
        registerViewModels()
        registerRepositories()
        registerApiService()
    }
    
    private func registerViewModels() {
        container.register(ToDoListViewModel.self) { _ in
            ToDoListViewModel()
        }
        container.register(ToDoItemViewModel.self) { (resolver, id: Int) in
            ToDoItemViewModel(todoItemId: id)
        }
    }
    
    private func registerRepositories() {
        container.register(LocalDataStore.self) { _ in
            LocalDataStoreImpl(userDefaults: UserDefaults.standard)
        }
    }
    
    private func registerApiService() {
        container.register(ApiService.self) { _ in
            ApiServiceImpl()
        }
    }
    
    public static func resolve<T>() -> T {
        Injection().resolve()
    }
    
    private func resolve<T>() -> T {
        guard let result  = container.resolve(T.self) else {
            fatalError("Unregisterred type: \(T.self)")
        }
        return result
    }
    
    public static func resolve<T, A>(argument: A) -> T {
        Injection().resolve(argument: argument)
    }
    
    private func resolve<T, A>(argument: A) -> T {
        guard let result  = container.resolve(T.self, argument: argument) else {
            fatalError("Unregisterred type: \(T.self)")
        }
        return result
    }
}
