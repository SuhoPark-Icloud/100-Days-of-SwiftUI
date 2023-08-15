//
//  ContentView.swift
//  Instafilter
//
//  Created by 박수호 on 2023/06/06.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount: CGFloat = 0.0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }

    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0 ... 20)
                .onChange(of: blurAmount) { newValue in
                    print("New value is \(newValue)")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
