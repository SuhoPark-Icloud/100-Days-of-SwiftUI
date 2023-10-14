//
//  DataController.swift
//  Bookworm2
//
//  Created by 박수호 on 10/10/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        for i in 0 ..< 10 {
            let newBook = Book(context: viewContext)
            newBook.id = UUID()
            newBook.title = "Harry Poter \(i)"
            newBook.author = "조엔 K 롤링"
            newBook.rating = Int16(i % 5) + 1
            newBook.genre = "Fantasy"
            newBook.review = "최고의 판타지"
            newBook.date = Date.now
        }

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Bookworm")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
