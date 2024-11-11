//
//  ToDoItemScreen.swift
//  PAM_iOS
//
//  Created by kmate on 04/11/2024.
//

import SwiftUI

struct ToDoItemScreen: View {
    @ObservedObject private var viewModel: ToDoItemViewModel
    
    init(itemId: Int) {
        self.viewModel = Injection.resolve(argument: itemId)
    }
    
    var body: some View {
        VStack {
            Text("ToDoItem: \(String(describing: viewModel.todoItem))")
        }
    }
}

struct ToDoItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemScreen(itemId: 1)
    }
}
