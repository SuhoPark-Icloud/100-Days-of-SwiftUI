//
//  ContentView.swift
//  UnitConversion
//
//  Created by 박수호 on 2022/12/01.
//

import SwiftUI

struct ContentView: View {
    var units = ["m", "km", "ft", "yd", "mi"]
    
    @State private var inputUnit: String = "m"
    @State private var outputUnit = "km"
    @FocusState private var inputLengthFocused: Bool
    
    @State private var inputLength = 1.0
    
    var inputLength_m: Double {
        switch inputUnit {
        case "m":
            return inputLength
        case "km":
            return inputLength * 1000
        case "ft":
            return inputLength * 0.3048
        case "yd":
            return inputLength * 0.9144
        case "mi":
            return inputLength * 1609.34
        default:
            return 0.0
        }
    }
    
    var outputLength: Double {
        switch outputUnit {
        case "m":
            return inputLength_m
        case "km":
            return inputLength_m / 1000
        case "ft":
            return inputLength_m / 0.3048
        case "yd":
            return inputLength_m / 0.9144
        case "mi":
            return inputLength_m / 1609.34
        default:
            return 0.0
        }
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Input units", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("input units")
            }
            
            Section {
                Picker("Output units", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Output units")
            }
            
            Section {
                TextField("Please enter length", value: $inputLength, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($inputLengthFocused)
            } header: {
                Text("input length")
            }
            
            Section {
                Text(outputLength, format: .number)
            } header: {
                Text("output length")
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    inputLengthFocused = false
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
