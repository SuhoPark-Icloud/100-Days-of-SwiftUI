//
//  Binding.swift
//  Bookworm
//
//  Created by 박수호 on 2023/04/09.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool // 안되는 이유는 잘 모르겠음...
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom)
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct BindingPractice: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct Binding_Previews: PreviewProvider {
    static var previews: some View {
        BindingPractice()
    }
}
