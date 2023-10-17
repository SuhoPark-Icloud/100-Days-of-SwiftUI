//
//  Movie+CoreDataProperties.swift
//  CoreDataProject2
//
//  Created by Suho Park on 10/17/23.
//
//

import CoreData
import Foundation

public extension Movie {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged var title: String?
    @NSManaged var director: String?
    @NSManaged var year: Int16

    var wrappedTitle: String {
        title ?? "Unknown Title"
    }
}

extension Movie: Identifiable {}
