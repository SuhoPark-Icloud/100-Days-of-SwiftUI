//
//  ContentView.swift
//  Moonshot
//
//  Created by 박수호 on 2023/02/04.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText \(text)")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView() {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity) // 스크롤바가 화면 끝에 오도록 설정
        }
        // 아래 코드로 가로로 스크롤하는 view도 생성 가능
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) {
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
