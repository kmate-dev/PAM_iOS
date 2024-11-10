//
//  ToDoItemScreen.swift
//  PAM_iOS
//
//  Created by kmate on 04/11/2024.
//

import SwiftUI

struct ToDoItemScreen: View {
    @ObservedObject private var viewModel: ToDoItemViewModel = Injection.resolve()
    private var itemId: Int
    
    init(itemId: Int) {
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
        ToDoItemScreen(itemId: 1)
    }
}
