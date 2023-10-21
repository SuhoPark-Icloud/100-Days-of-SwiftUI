//
//  Persistence.swift
//  CoreDataProject2
//
//  Created by Suho Park on 10/16/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        for i in 0 ..< 6 {
            let newWizard = Wizard(context: viewContext)
            newWizard.name = "Wizard #\(i)"
        }

        let ship1 = Ship(context: viewContext)
        ship1.name = "Enterprise"
        ship1.universe = "Star Trek"

        let ship2 = Ship(context: viewContext)
        ship2.name = "Defiant"
        ship2.universe = "Star Trek"

        let ship3 = Ship(context: viewContext)
        ship3.name = "Millennium Falcon"
        ship3.universe = "Star Wars"

        let ship4 = Ship(context: viewContext)
        ship4.name = "Executor"
        ship4.universe = "Star Wars"

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
        container = NSPersistentContainer(name: "CoreDataProject")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
