//
//  ContentView.swift
//  PAM_iOS
//
//  Created by kmate on 12/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ToDoScreen()
    }
}

struct ToDoScreen: View {
    @ObservedObject var viewModel = ToDoViewModel()
    @State private var newItemValue = ""
    
    var body: some View {
        NavigationView {
            if (viewModel.loading) {
                ProgressView("Loading...")
                    .padding()
            } else {
                VStack {
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
                .padding()
            }
        }
    }
    
}

struct ToDoScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToDoScreen()
    }
}
