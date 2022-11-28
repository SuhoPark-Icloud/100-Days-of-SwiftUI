//
//  ContentView.swift
//  WeSplit
//
//  Created by 박수호 on 2022/11/27.
//

import SwiftUI

struct ContentView: View {
    // 프로퍼티를 그저 보여주는 것과
    // 프로퍼티에 값을 대입할 수 있는 것을 구분함
    @State private var name = ""
    
    var body: some View {
        Form {
            //$: 양방향 바인딩(@State 된 것을 보여줄 뿐만 아니라, 기록된 것을 프로퍼티에 저장)
            TextField("Enter your name", text: $name)
            
            // 여기서는 양방향 바인딩이 아닌, 그저 변수를 보여줄 뿐이기 때문에 $가 제외
            Text("Your name is \(name)")
        }
    }
}

// Option+Cmd+P: 미리보기 다시 시작
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
