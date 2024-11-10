//
//  ToDoListScreen.swift
//  PAM_iOS
//
//  Created by kmate on 04/11/2024.
//

import SwiftUI

struct ToDoListScreen: View {
    @ObservedObject var viewModel: ToDoListViewModel = Injection.resolve()
    @State private var newItemValue = ""
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                if (viewModel.loading) {
                ProgressView("Loading...")
                    .padding()
                } else {
                    TextField("New ToDo Item", text: $newItemValue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        viewModel.addToDoItem(name: newItemValue)
                    }) {
                        Text("Add note")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    List {
                        ForEach(viewModel.todosList) { item in
                            HStack {
                                Text(item.name)
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        router.push(to: .todoitem(itemId: item.id))
                                    }
                                
                                Spacer()
                                Button(action: {
                                    viewModel.completeItem(id: item.id)
                                }) {
                                    Image(systemName: item.completed ? "largecircle.fill.circle" : "circle")
                                        .foregroundColor(item.completed ? .blue : .gray)
                                }
                                
                            }
                            .contentShape(Rectangle())
                        }
                    }
                }
            }
            .padding()
            .navigationDestinationRoute()
        }
    }
        
}

struct ToDoListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListScreen(viewModel: ToDoListViewModel())
    }
}
