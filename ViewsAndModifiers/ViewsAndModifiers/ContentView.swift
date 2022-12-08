//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by 박수호 on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
//    let motto1 = Text("Draco dormiens")
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")
    
    // 별도의 view는 body와 달리 여러개의 속성을 자동으로 정렬하는 기능이 X
    // 내부에 VStack이나 Group을 추가하는 것도 방법이지만
    // @ViewBuilder를 추가하는 방법 권장
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            spells
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
