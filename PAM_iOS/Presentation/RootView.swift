//
//  RootNavigationView.swift
//  PAM_iOS
//
//  Created by kmate on 04/11/2024.
//

import Foundation
import SwiftUI

struct RootView: View {
    private let router: Router
    private let toDoListViewModel = ToDoListViewModel()
    
    init() {
        self.router = Router()
    }
    
    var body: some View {
        ToDoListScreen(viewModel: toDoListViewModel)
            .environmentObject(router)
    }
}
