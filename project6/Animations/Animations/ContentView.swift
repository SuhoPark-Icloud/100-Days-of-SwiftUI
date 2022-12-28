//
//  ContentView.swift
//  Animations
//
//  Created by 박수호 on 2022/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled) // nil로 설정함으로서 애니메이션 컬러 변경에 따른 애니메이션 제거
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        // 변경 내용에 대한 개별적인 애니메이션 효과 적용 가능
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
