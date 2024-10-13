//
//  ContentView.swift
//  PAM_iOS
//
//  Created by kmate on 12/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ToDoScreen: View {
    @State private var newItemValue = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("New ToDo Item", text: $newItemValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    //TODO viewmodel
                }) {
                    Text("Add note")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                let toDoListMock: [ToDoItem] = [
                    ToDoItem(id: 0, name: "Prepare Android Example", completed: false),
                    ToDoItem(id: 1, name: "Prepare iOS example", completed: false)
                ]
                List {
                    ForEach(toDoListMock) { item in
                        HStack {
                            Text(item.name)
                                .foregroundColor(.black)
                            Spacer()
                            Button(action: {
                                //TODO viewmodel
                            }) {
                                Image(systemName: item.completed ? "largecircle.fill.circle" : "circle")
                                    .foregroundColor(item.completed ? .blue : .gray)
                            }
                            
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            //TODO viewmodel
                        }
                    }
                }
            }
            .padding()
            
        }
    }
    
}

struct ToDoScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToDoScreen()
    }
}
