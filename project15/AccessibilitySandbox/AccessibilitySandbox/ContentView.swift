//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by 박수호 on 2023/09/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(decorative: "character")
                .resizable()
                .scaledToFit()
                .accessibilityHidden(true)

            VStack {
                Text("Your score is")
                Text("1000")
                    .font(.title)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Your score is 1000")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
