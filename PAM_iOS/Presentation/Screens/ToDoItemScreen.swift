//
//  ToDoItemScreen.swift
//  PAM_iOS
//
//  Created by kmate on 04/11/2024.
//

import SwiftUI

struct ToDoItemScreen: View {
    @ObservedObject private var viewModel: ToDoItemViewModel
    private var itemId: Int
    private var injectedString: String
    
    init(viewModel: ToDoItemViewModel, itemId: Int, injectedString: String) {
        self.viewModel = viewModel
        self.itemId = itemId
        self.injectedString = injectedString
    }
    
    var body: some View {
        VStack {
            Text("This screen should show details of item: \(itemId)")
            Text("Injection example: \(injectedString)")
        }
    }
}

struct ToDoItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemScreen(viewModel: ToDoItemViewModel(), itemId: 1, injectedString: "Hello")
    }
}
