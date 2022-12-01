//
//  ContentView.swift
//  UnitConversion
//
//  Created by 박수호 on 2022/12/01.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double?
    @State private var inputUnit = "m"
    @State private var outputUnit = "km"
    @FocusState private var inputValueFocused: Bool
    var lengthUnits = ["m", "km", "ft", "yd", "mi"]
    
    
    var body: some View {
        Form {
            Section {
                Picker("Input units", selection: $inputUnit) {
                    ForEach(lengthUnits, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("input units")
            }
            
            Section {
                Picker("Input units", selection: $outputUnit) {
                    ForEach(lengthUnits, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("input units")
            }
            
            Section {
                TextField("Put the value", value: $inputValue, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($inputValueFocused)
            } header: {
                Text("input value")
            }
            
            Section {
                Text("100")
            } header: {
                Text("output value")
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    inputValueFocused = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
