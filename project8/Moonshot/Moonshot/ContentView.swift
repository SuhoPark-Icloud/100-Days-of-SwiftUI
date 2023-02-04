//
//  ContentView.swift
//  Moonshot
//
//  Created by 박수호 on 2023/02/04.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        // 동적 크기 지정 가능
        // 화면 크기가 변화됨에 따라 열 개수도 바뀔 수 있음
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        // 세로 스크롤 버전
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(1..<1000) {
                    Text("Item \($0)")
                }
            }
        }
        
        // 가로 스크롤 버전
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
