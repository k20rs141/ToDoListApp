//
//  toDoListAppApp.swift
//  toDoListApp
//
//  Created by 山田滉暁 on 2022/04/28.
//

import SwiftUI

@main
struct toDoListAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            HomeView()
        }
    }
}
