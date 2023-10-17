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

    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]

    var body: some View {
        let movie = Movie(context: viewContext)

        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

#Preview {
    ContentView()
//        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
