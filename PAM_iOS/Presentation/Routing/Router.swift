//
//  AppRoute.swift
//  PAM_iOS
//
//  Created by kmate on 04/11/2024.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var path = [AppRoute]()

    func push(to destination: AppRoute) {
        path.append(destination)
    }

    func pop() {
        path.removeLast()
    }
    
    enum AppRoute: Hashable {
        func hash(into hasher: inout Hasher) {
            var index = 0
            switch self {
            case .todolist:
                index = 0
            case .todoitem:
                index = 1
            }
            hasher.combine(index)
        }
        
        static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
            lhs.hashValue == rhs.hashValue
        }
        
        case todolist(viewModel: ToDoListViewModel)
        case todoitem(viewModel: ToDoItemViewModel, itemId: Int)
    }
}

struct NavigationDestinationRoute: ViewModifier {
    func body(content: Content) -> some View {
        content.navigationDestination(for: Router.AppRoute.self) { route in
            switch route {
                case .todolist(let viewModel):
                    ToDoListScreen(viewModel: viewModel)
                case .todoitem(let viewModel, let itemId):
                    ToDoItemScreen(viewModel: viewModel, itemId: itemId)
            }
        }
    }
}

extension View {
    func navigationDestinationRoute() -> some View {
        modifier(NavigationDestinationRoute())
    }
}
