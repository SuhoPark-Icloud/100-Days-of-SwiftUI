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
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
            Text("Your content")
//                .foregroundColor(.secondary)
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
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
