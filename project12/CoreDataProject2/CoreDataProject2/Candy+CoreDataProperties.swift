//
//  Candy+CoreDataProperties.swift
//  CoreDataProject2
//
//  Created by Suho Park on 10/25/23.
//
//

import CoreData
import Foundation

public extension Candy {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged var name: String?
    @NSManaged var origin: Country?

    var wrappedName: String {
        name ?? "Unknown Candy"
    }
}

extension Candy: Identifiable {}
