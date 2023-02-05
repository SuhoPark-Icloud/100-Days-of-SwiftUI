//
//  ContentView.swift
//  Moonshot
//
//  Created by 박수호 on 2023/02/04.
//

import SwiftUI

struct ContentView: View {
    // decode가 generic method이기 때문에 명시적 타입 지정 필요
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            Text("\(astronauts.count)")
            Text("\(missions.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
