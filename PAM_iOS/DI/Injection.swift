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
    }
    
    private func registerViewModels() {
        container.register(ToDoListViewModel.self) { _ in
            ToDoListViewModel()
        }
        container.register(ToDoItemViewModel.self) { _ in
            ToDoItemViewModel()
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
}
