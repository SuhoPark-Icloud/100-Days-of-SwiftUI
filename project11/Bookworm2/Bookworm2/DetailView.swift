//
//  DetailView.swift
//  Bookworm2
//
//  Created by 박수호 on 10/11/23.
//

import CoreData
import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var showingDeleteAlert = false

    let book: Book

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing, content: {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()

                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            })

            Text(book.author ?? "Unknown author")
                .font(.title)
                .foregroundColor(.secondary)

            Text(book.review ?? "No review")
                .padding()

            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .alert("Delete book",
               isPresented: $showingDeleteAlert,
               actions: {
                   Button("Delete", role: .destructive, action: deleteBook)
                   Button("Cancel", role: .cancel) {}
               },
               message: { Text("Are you sure?") })
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        })
    }

    func deleteBook() {
        viewContext.delete(book)

        dismiss()
    }
}

#Preview {
    let viewContext = PersistenceController.preview.container.viewContext
    let book = Book(context: viewContext)

    book.title = "Test book"
    book.author = "Test author"
    book.genre = "Fantasy"
    book.rating = 4
    book.review = "This was a great book; I really enjoyed it."

    return DetailView(book: book).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
