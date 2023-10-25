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
    @FetchRequest(sortDescriptors: []) private var countries: FetchedResults<Country>

    var body: some View {
        List {
            ForEach(countries, id: \.self) { country in
                Section(country.wrappedFullName) {
                    ForEach(country.candyArray, id: \.self) { candy in
                        Text(candy.wrappedName)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
