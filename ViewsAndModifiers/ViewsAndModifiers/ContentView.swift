//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by 박수호 on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello World") {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red: .blue)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
