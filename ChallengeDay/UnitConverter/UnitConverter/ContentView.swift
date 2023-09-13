//
//  ContentView.swift
//  UnitConverter
//
//  Created by 박수호 on 2023/09/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TemperatureConverter()
                .tabItem {
                    Label("Temperature", systemImage: "thermometer")
                }

            LengthConverter()
                .tabItem {
                    Label("Length", systemImage: "ruler")
                }

            TimeConverter()
                .tabItem {
                    Label("Time", systemImage: "clock")
                }

            VolumnConverter()
                .tabItem {
                    Label("Volume", systemImage: "square.stack.3d.up.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
