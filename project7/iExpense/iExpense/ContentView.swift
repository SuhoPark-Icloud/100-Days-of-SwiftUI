//
//  ContentView.swift
//  iExpense
//
//  Created by 박수호 on 2023/01/24.
//

import SwiftUI

// Codable 프로토콜을 준수하게 함으로써 JSON으로의 형변환을 지원하게 된다.
// Codable = Decodable & Encodable
struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Suho", lastName: "Park")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            // JSONEncoder에 의해 data라는 포맷으로 변환되는데,
            // 이는 UserDefaults에 저장할 수 있는 타입이다.
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
            
            // 향후 다시 사용하고 싶으면 JSONDecoder를 사용해야 한다.
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
