//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by 박수호 on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Hello World") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
