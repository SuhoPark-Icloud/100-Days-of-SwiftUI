//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by 박수호 on 2023/04/13.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
