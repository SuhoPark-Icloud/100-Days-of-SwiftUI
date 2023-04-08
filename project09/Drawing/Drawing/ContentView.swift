//
//  ContentView.swift
//  Drawing
//
//  Created by 박수호 on 2023/03/15.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.3
    
    var body: some View {
        // blendMode(.multiply)는 일반적이라 다른 대안이 있다.
//        ZStack {
//            Image("PaulHudson")
//
//            Rectangle()
//                .fill(.red)
//                .blendMode(.multiply)
//        }
//        .frame(width: 400, height: 500)
//        .clipped()
        VStack {
            Image("PaulHudson")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
