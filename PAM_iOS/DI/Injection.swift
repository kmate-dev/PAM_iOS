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
        registerExample()
    }
    
    private func registerExample() {
        container.register(String.self) {_ in "Hello from dependency injection using Swinject"}
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
