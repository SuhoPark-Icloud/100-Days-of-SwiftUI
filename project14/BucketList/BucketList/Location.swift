//
//  Location.swift
//  BucketList
//
//  Created by 박수호 on 2023/08/31.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
