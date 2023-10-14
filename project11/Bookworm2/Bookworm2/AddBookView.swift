//
//  AddBookView.swift
//  Bookworm2
//
//  Created by 박수호 on 10/10/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var showingAlert = false

    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }

                Section {
                    Button("Save") {
                        let newBook = Book(context: viewContext)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        newBook.date = Date.now

                        try? viewContext.save()
                        dismiss()
                    }
                    .disabled(!isSaveButtonEnabled())
                }
            }
            .navigationTitle("Add Book")
        }
    }

    func isSaveButtonEnabled() -> Bool {
        let isTitle = !title.isEmpty
        let isAuthor = !author.isEmpty

        if isTitle && isAuthor { return true }
        else { return false }
    }
}

#Preview {
    AddBookView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
