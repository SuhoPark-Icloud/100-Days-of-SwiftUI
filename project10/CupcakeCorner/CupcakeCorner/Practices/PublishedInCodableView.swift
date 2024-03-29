//
//  PublishedInCodableView.swift
//  CupcakeCorner
//
//  Created by 박수호 on 2023/04/08.
//

import SwiftUI

class User: ObservableObject, Codable {
    @Published var name = "Suho Park"
    
    enum CodingKeys: CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct PublishedInCodableView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PublishedInCodableView_Previews: PreviewProvider {
    static var previews: some View {
        PublishedInCodableView()
    }
}
