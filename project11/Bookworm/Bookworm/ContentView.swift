//
//  ContentView.swift
//  Bookworm
//
//  Created by 박수호 on 2023/04/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MulitlineTextEditor()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
