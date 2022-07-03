//
//  MyTasks.swift
//  EcoDo
//
//  Created by YesVladess on 03.07.2022.
//

import SwiftUI

struct MyTasks: View {

    @Environment(\.managedObjectContext) var context

    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems())
    var items: FetchedResults<ToDoItem>

    @State var text: String = ""

    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    HStack {
                        TextField("Enter new task", text: $text)
                        Button( action: {
                            if !text.isEmpty {
                                let newItem = ToDoItem(context: context)
                                newItem.name = text
                                newItem.createdAt = Date()
                                saveToDatabase()
                                text = ""
                            }
                        }, label: {
                            Text("Add Task")
                        })
                    }
                    ForEach(items) { todoItem in
                        VStack(alignment: .leading) {
                            Text(todoItem.name!)
                                .font(.headline)
                            Text("\(todoItem.createdAt!)")
                        }
                    }
                    .onDelete { indexSet in
                        guard let index = indexSet.first else { return }
                        let itemToDelete = items[index]
                        context.delete(itemToDelete)
                        saveToDatabase()
                    }
                }, header: {
                    Text("New Item")
                })
            }.navigationTitle("My Tasks")
        }
    }

    private func saveToDatabase() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }

}

struct MyTasks_Previews: PreviewProvider {
    static var previews: some View {
        MyTasks()
            .environment(\.managedObjectContext,
                          PersistenceController.preview.container.viewContext)
    }
}
