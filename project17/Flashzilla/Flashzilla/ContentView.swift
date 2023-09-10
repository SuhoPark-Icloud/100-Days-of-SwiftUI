//
//  ContentView.swift
//  Flashzilla
//
//  Created by 박수호 on 2023/09/11.
//

import SwiftUI

struct ContentView: View {
    // 원이 얼마나 멀리 끌려갔는지
    @State private var offset = CGSize.zero

    // 현재 드래그되고 있는지 여부
    @State private var isDragging = false

    var body: some View {
        // 오프셋을 업데이트하고 움직일 때 드래그하는 드래그 제스처
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }

        // isDragging을 가능하게 하는 길게 누르는 제스처
        let pressGesture = LongPressGesture()
            .onEnded { _ in
                withAnimation {
                    isDragging = true
                }
            }

        // 사용자가 길게 누른 다음 드래그하도록 강제하는 결합된 제스처
        let combined = pressGesture.sequenced(before: dragGesture)

        // 드래그할 때 크기를 조정하고, 드래그 제스처에서 가져온 모든 것으로 오프셋을 설정하고, 결합된 제스처를 사용하는 64x64 원
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
