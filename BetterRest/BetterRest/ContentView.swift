//
//  ContentView.swift
//  BetterRest
//
//  Created by 박수호 on 2022/12/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 국가에 따라 년월일을 정렬하는 순서가 달라질 수 있기 때문에
        // 이를 formatted에 맡길 수 있다.
        Text(Date.now.formatted(date: .long, time: .omitted))
    }
    
    func trivialExample() {
        var components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
