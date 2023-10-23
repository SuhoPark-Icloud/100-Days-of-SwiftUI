//
//  FilteredList.swift
//  CoreDataProject2
//
//  Created by Suho Park on 10/23/23.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>

    // this is our content closure
    // we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }

    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

#Preview {
    FilteredList(filterKey: "lastName", filterValue: "A") { (singer: Singer) in
        Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
    }
    .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
