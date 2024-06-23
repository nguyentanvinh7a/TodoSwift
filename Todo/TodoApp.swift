//
//  TodoApp.swift
//  Todo
//
//  Created by Pham Thi Thanh Thuy on 09/06/2024.
//

import SwiftUI

@main
struct TodoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
