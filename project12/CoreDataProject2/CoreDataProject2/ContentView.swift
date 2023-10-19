//
//  ContentView.swift
//  CoreDataProject2
//
//  Created by Suho Park on 10/16/23.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var wizards: FetchedResults<Wizard>

    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]

    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }

            Button("Add") {
                let wizard = Wizard(context: viewContext)
                wizard.name = "Harry Potter"
            }

            Button("Save") {
                do {
                    if viewContext.hasChanges {
                        try viewContext.save()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
