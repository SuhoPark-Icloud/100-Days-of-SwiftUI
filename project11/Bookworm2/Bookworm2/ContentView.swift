//
//  ContentView.swift
//  Bookworm2
//
//  Created by 박수호 on 10/3/23.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) private var books: FetchedResults<Book>

    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading, content: {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundStyle(.secondary)
                            })
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
