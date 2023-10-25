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

        let taylor = Singer(context: viewContext)
        taylor.firstName = "Taylor"
        taylor.lastName = "Swift"

        let ed = Singer(context: viewContext)
        ed.firstName = "Ed"
        ed.lastName = "Sheeran"

        let adele = Singer(context: viewContext)
        adele.firstName = "Adele"
        adele.lastName = "Adkins"

        let candy1 = Candy(context: viewContext)
        candy1.name = "Mars"
        candy1.origin = Country(context: viewContext)
        candy1.origin?.shortName = "UK"
        candy1.origin?.fullName = "United Kingdom"

        let candy2 = Candy(context: viewContext)
        candy2.name = "KitKat"
        candy2.origin = Country(context: viewContext)
        candy2.origin?.shortName = "UK"
        candy2.origin?.fullName = "United Kingdom"

        let candy3 = Candy(context: viewContext)
        candy3.name = "Twix"
        candy3.origin = Country(context: viewContext)
        candy3.origin?.shortName = "UK"
        candy3.origin?.fullName = "United Kingdom"

        let candy4 = Candy(context: viewContext)
        candy4.name = "Toblerone"
        candy4.origin = Country(context: viewContext)
        candy4.origin?.shortName = "CH"
        candy4.origin?.fullName = "Switzerland"

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
