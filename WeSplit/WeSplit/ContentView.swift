//
//  ContentView.swift
//  WeSplit
//
//  Created by 박수호 on 2022/11/27.
//

import SwiftUI

// View protocol을 준수하는 새로운 구조체 정의
// 화면에 보여지기 위해 무조건 적용되어야 하는 프로토콜
struct ContentView: View {
    // computed property
    // some View: layout인 View 프로토콜을 준수하는 것을 반환한다는 의미
    // 그러나 모든 항목들을 완벽히 준수할 필요는 없다는 의미의 some
    // View protocol의 유일한 요구사항은 var body: some View 프로퍼티를 갖는 것
    var body: some View {
        NavigationView {
            Form {
                // Section은 구분감을 준다.
                Section {
                    Text("Hello, world!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Option+Cmd+P: 미리보기 다시 시작
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
