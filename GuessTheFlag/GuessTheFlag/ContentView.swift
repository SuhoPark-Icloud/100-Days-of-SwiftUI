//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 박수호 on 2022/12/03.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        // 수정자가 사용되는 위치는 중요하지 X
        // 모든 작업은 경고가 존재하고, showingAlert가 true일 때 경고 표시
        .alert("Important message", isPresented: $showingAlert) {
            // alert 내부 모든 버튼은 자동으로 alert 해제
//            Button("Delete", role: .destructive) {}
//            Button("Cancel", role: .cancel) {}
            Button("OK", role: .cancel) {}
        } message: {
            // 두 번째 후행 클로저를 사용하여 제목 아래 메시지 추가 가능
            Text("Please read this.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
