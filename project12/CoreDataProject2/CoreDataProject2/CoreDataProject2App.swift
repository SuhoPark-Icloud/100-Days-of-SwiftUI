//
//  CoreDataProject2App.swift
//  CoreDataProject2
//
//  Created by Suho Park on 10/16/23.
//

import SwiftUI

@main
struct CoreDataProject2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
