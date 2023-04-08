//
//  TaylorSwiftSongsView.swift
//  CupcakeCorner
//
//  Created by 박수호 on 2023/03/20.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct TaylorSwiftSongsView: View {
    @State private var results = [Result]()

    var body: some View {
        VStack {
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
            }
            // .task() modifier는 비동기 함수를 호출할 수 있다.
            // .onAppear()과 유사하나 onAppear은 비동기 함수 호출이 불가
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct TaylorSwiftSongsView_Previews: PreviewProvider {
    static var previews: some View {
        TaylorSwiftSongsView()
    }
}
