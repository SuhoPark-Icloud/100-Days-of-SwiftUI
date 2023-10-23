//
//  Singer+CoreDataProperties.swift
//  CoreDataProject2
//
//  Created by Suho Park on 10/23/23.
//
//

import CoreData
import Foundation

public extension Singer {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?

    // custom properties
    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }

    var wrappedLastName: String {
        lastName ?? "Unknown"
    }
}

extension Singer: Identifiable {}
