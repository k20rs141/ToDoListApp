//
//  ContentView.swift
//  toDoListApp
//
//  Created by 山田滉暁 on 2022/04/28.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) var viewContext
    
    @State var showAddTaskView: Bool = false
    
    //データの取得
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.name, ascending: false)], animation: .easeInOut) var tasks: FetchedResults<Task>
    
    var body: some View {
//        NavigationView {
//            List {
//                ForEach(self.tasks, id: \.self) { task in
//                    HStack {
//                        Text(task.name ?? "nil")
//
//                        Spacer()
//
//                        Text(task.priority ?? "nil")
//                    }
//                }
//            }
//            .listStyle(.plain)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        self.showAddTaskView.toggle()
//                    }) {
//                        Image(systemName: "plus")
//                    }
//                    .sheet(isPresented: $showAddTaskView) {
//                        AddTaskView().environment(\.managedObjectContext, self.viewContext)
//                    }
//                }
//            }
//            .navigationBarTitle("ToDo")
//            .navigationBarTitleDisplayMode(.inline)
//        }
        HomeView().environment(\.managedObjectContext, self.viewContext)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
