//
//  ContentView.swift
//  iExpense
//
//  Created by 박수호 on 2023/01/24.
//

import SwiftUI

struct ContentView: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    // UserDefaults에 대한 직접적인 접근 대신 @AppStorage를 사용
    // @State의 역할과 코드를 더 단순하게 만들 수 있다는 점에서 UserDefaults를 완전히 대체할 수 있다.
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
//            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
