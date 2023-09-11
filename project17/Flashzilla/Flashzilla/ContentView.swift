//
//  ContentView.swift
//  Flashzilla
//
//  Created by 박수호 on 2023/09/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Rectangle tapped!")
                    }

                Circle()
                    .fill(.red)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Circle tapped!")
                    }
                    .allowsHitTesting(false)
            }

            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                print("VStack tapped!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
