//
//  ContentView.swift
//  CoreDataProject2
//
//  Created by Suho Park on 10/16/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [],
//        predicate: NSPredicate(format: "universe == 'Star Wars'")
//        predicate: NSPredicate(format: "universe == %@", "Star Wars") // comparison
//        predicate: NSPredicate(format: "name < %@", "F") // comparision
//        predicate: NSPredicate(format: "universe IN %@", ["Aliens", "Star Trek"]) // inclusion
//        predicate: NSPredicate(format: "name BEGINSWITH %@", "E") // start character
//        predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e") // case-insensitive
//        predicate: NSPredicate(format: "name CONTAINS[c] %@", "en") // anywhere inside
//        predicate: NSPredicate(format: "name CONTAINS[c] %@", "en") // anywhere inside
        predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e") // inverse
    )
    private var ships: FetchedResults<Ship>

    var body: some View {
        List(ships, id: \.self) { ship in
            VStack {
                Text(ship.name ?? "Unknown")
                Text(ship.universe ?? "Unknown")
                    .font(.callout)
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
