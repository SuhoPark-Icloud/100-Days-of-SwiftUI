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
                                    .foregroundStyle(book.rating <= 1 ? .red : .primary)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundStyle(.secondary)
                            })
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }

    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]

            viewContext.delete(book)
        }

        try? viewContext.save()
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
