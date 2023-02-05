//
//  Mission.swift
//  Moonshot
//
//  Created by 박수호 on 2023/02/05.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String? // 존재하지 않을 수 있는 타입은 옵셔널로 지정해야 함
    let crew: [CrewRole]
    let description: String
}
