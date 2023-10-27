//
//  ContentView.swift
//  CoreDataProject2
//
//  Created by Suho Park on 10/16/23.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var filterKey = "lastName"
    @State private var filterValue = "S"

    var body: some View {
        Form {
            Section("Enter filter key") {
                TextField("Filter key", text: $filterKey)
            }

            Section("Enter filter value") {
                TextField("Filter value", text: $filterValue)
            }

            Section("Filtered results") {
                FilteredList(filterKey: filterKey, filterValue: filterValue, predicateType: .biginsWith, sortDescriptor: []) { (singer: Singer) in
                    Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
