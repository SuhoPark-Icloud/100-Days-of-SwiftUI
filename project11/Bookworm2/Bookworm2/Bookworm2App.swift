//
//  Bookworm2App.swift
//  Bookworm2
//
//  Created by 박수호 on 10/3/23.
//

import SwiftUI

@main
struct Bookworm2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
