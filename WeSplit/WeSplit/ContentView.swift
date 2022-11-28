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
        Form {
            // 모든 SwiftUI에서는 10개를 초과하는 자식을 둘 수 없다.
            // 11개의 항목을 포함하려면 Group으로 묶어야 한다.
            // Group은 실제로 보이는 것을 변경하지 않는다.
            Group {
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }
            
            // Section은 구분감을 준다.
            Section {
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }
        }
    }
}

// Option+Cmd+P: 미리보기 다시 시작
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
