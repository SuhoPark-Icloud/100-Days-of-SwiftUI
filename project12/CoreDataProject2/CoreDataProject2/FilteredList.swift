//
//  FilteredList.swift
//  CoreDataProject2
//
//  Created by Suho Park on 10/23/23.
//

import SwiftUI

struct FilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Singer>

    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }

    init(filter: String) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}

#Preview {
    FilteredList(filter: "S")
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
