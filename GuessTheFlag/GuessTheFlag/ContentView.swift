//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 박수호 on 2022/12/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 선형 그래디언트
        LinearGradient(gradient: Gradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55)
            // 여기에서 Gradient.Stop을 생성할 것을 알고 있으므로 유형 생략 가능
            .init(color: .white, location: 0.45),
            .init(color: .black, location: 0.55)
        ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        
        // 방사형 그래디언트
        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
            .ignoresSafeArea()
        
        // 각도 그래디언트
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            .ignoresSafeArea()
        
        // 모든 그라데이션 유형에는 색상 뿐만 아니라 정지점 제공
        // 독립 실행도 가능하고, 수정자의 일부로 사용 가능
        //  예) Text()의 배경
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
