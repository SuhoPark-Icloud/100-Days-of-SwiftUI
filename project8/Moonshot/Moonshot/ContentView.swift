//
//  ContentView.swift
//  Moonshot
//
//  Created by 박수호 on 2023/02/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height) // view를 중앙에 두기 위해 사용
            // height를 생략할 수 있음
            // -> 화면 크기, 그 비율, 사진의 비율을 알기 때문에 자동 선택됨
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
