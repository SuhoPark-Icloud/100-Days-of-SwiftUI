//
//  ContentView.swift
//  WeSplit
//
//  Created by 박수호 on 2022/11/27.
//

import SwiftUI

// ContentView는 상수로 생성될 수 있는 구조체
//  => 값을 자유롭게 변경할 수 없다.
//  => 게다가 계산된 속성은 mutating으로 만들 수도 없다.
struct ContentView: View {
    // 속성 래퍼(property wrapper)
    // 속성 앞에 배치할 수 있는 특수 속성
    // @State: 하나의 view에서 저장되는 간단한 속성을 위해 특별히 설계
    //  (private와 함께 사용)
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}

// Option+Cmd+P: 미리보기 다시 시작
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
