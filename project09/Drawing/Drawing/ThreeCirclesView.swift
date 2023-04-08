//
//  ThreeCircles.swift
//  Drawing
//
//  Created by 박수호 on 2023/03/17.
//

import SwiftUI

struct ThreeCircles: View {
    @State private var amount = 0.3
    
    // .screen: .multiply의 반대
    // 색상을 반전시키고, 곱셈을 수행한 다음, 다시 반전시켜, 더 어두운 이미지보다는 더 밝은 이미지를 만듬
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.red)
                // 대신 아래 Color로 대체할 수 있음
//                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.green)
//                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.blue)
//                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct ThreeCircles_Previews: PreviewProvider {
    static var previews: some View {
        ThreeCircles()
    }
}
