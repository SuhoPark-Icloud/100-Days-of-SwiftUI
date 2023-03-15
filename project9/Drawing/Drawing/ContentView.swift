//
//  ContentView.swift
//  Drawing
//
//  Created by 박수호 on 2023/03/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            // .stroke를 사용하면서 더 이상 필요가 없어짐
//            path.closeSubpath()
        }
        // lineCap: 선이 끝나는 지점에 대한 정의
        // lineJoin: 두 선이 연결되는 지점에 대한 정의
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
