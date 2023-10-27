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

    private let predicate: String

    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }

    init(filterKey: String,
         filterValue: String,
         predicateType: PredicateTypes,
         sortDescriptor: [NSSortDescriptor],
         @ViewBuilder content: @escaping (T) -> Content)
    {
        predicate = "\(filterKey) \(predicateType.rawValue) '\(filterValue)'"
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptor, predicate: NSPredicate(format: predicate))
        self.content = content
    }

    enum PredicateTypes: String {
        case inside = "IN"
        case biginsWith = "BEGINSWITH"
        case contains = "CONTAINS"
    }
}

#Preview {
    FilteredList(filterKey: "lastName", filterValue: "S", predicateType: .contains, sortDescriptor: []) { (singer: Singer) in
        Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
    }
    .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
