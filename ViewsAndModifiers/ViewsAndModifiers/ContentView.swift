//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by 박수호 on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            // 개별 항목에 설정한 내용이 override됨
                .blur(radius: 0)
            // blur는 environment modifier가 아니기 때문에
            // VStack에 있는 내용이 덮어 씌워진다.
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title) //environment modifier
        .blur(radius: 5)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
