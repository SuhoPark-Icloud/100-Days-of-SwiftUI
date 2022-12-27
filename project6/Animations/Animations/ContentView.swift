//
//  ContentView.swift
//  Animations
//
//  Created by 박수호 on 2022/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            // Binding animation
            // View에 애니메이션을 설정하는 것이 아닌 바인딩된 값에 애니메이션 적용
            Stepper("Scale amount", value: $animationAmount.animation(
                // 특수 효과도 삽입 가능
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            // 버튼에는 .animation()을 적용하지 않았기 때문에 버튼을 눌렀을 때에는 애니메이션 적용 X
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
