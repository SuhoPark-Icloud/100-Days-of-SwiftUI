//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 박수호 on 2022/12/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Color 그 자체도 View
            Color.red
//                .frame(width: 200, height: 200)
                .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200)
            // 의미론적인 색상
            Color.primary //: 검은색/흰색(일반모드/다크모드)
            Color.secondary // 어두운회색/밝은회색(일반모드/다크모드)
            
            // RGB 색상
            Color(red: 1, green: 0.8, blue: 0)
            
            Text("Your content")
        }
        // 안전영역 아래로 채우기
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
