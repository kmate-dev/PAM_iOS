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
    
    init(viewModel: ToDoItemViewModel, itemId: Int) {
        self.viewModel = viewModel
        self.itemId = itemId
    }
    
    var body: some View {
        VStack {
            Text("This screen should show details of item: \(itemId)")
        }
    }
}

struct ToDoItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemScreen(viewModel: ToDoItemViewModel(), itemId: 1)
    }
}
