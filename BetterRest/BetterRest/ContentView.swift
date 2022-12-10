//
//  ContentView.swift
//  BetterRest
//
//  Created by 박수호 on 2022/12/10.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
