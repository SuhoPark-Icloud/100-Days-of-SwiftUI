//
//  ContentView.swift
//  Drawing
//
//  Created by 박수호 on 2023/03/15.
//

import SwiftUI

// InsettableShape: 안쪽으로 줄어드는 형태의 삽입 가능한 Shape
struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount = 0.0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        // InsettableShape를 위해 radius 부분 수정
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
    
    // InsettableShape protocol 준수를 위해 필요
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ContentView: View {
    var body: some View {
//        // 크기를 지정하지 않은 shape 호출은 화면을 최대한 가득 채우려고 한다
//        Circle()
//        // 단순 stroke는 두꺼운 선을 그리기 때문에 선의 일부가 화면 밖으로 빠져나간다
////            .stroke(.blue, lineWidth: 40)
//        // 선의 두께를 만들 때 중심보다는 원 내부 공간을 사용
//            .strokeBorder(.blue, lineWidth: 40)
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        // InsettableShape를 준수하게 됨으로써 stroke vs strokeBorder 모두 사용 가능하게 됨
//            .stroke(.blue, lineWidth: 40)
            .strokeBorder(.blue, lineWidth: 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
