//
//  TemperatureConverter.swift
//  UnitConverter
//
//  Created by 박수호 on 2023/09/12.
//

import SwiftUI

struct TemperatureConverter: View {
    enum Temperatures: String, CaseIterable, Identifiable {
        case celsius, Fahrenheit, Kelvin
        var id: Self { self }
    }

    @State private var input: Double?
    private var output: Double {
        return try! convertTemp(input)
    }

    @State private var inputType: Temperatures = .celsius
    @State private var outputType: Temperatures = .Fahrenheit

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Unit Type", selection: $inputType) {
                        ForEach(Temperatures.allCases) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input type")
                        .font(.subheadline)
                }

                Section {
                    Picker("Unit Type", selection: $outputType) {
                        ForEach(Temperatures.allCases) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output type")
                        .font(.subheadline)
                }

                Section {
                    TextField("Enter your input value", value: $input, format: .number)
                        .keyboardType(.numberPad)
                } header: {
                    Text("Input Value")
                        .font(.subheadline)
                }

                Section {
                    Text("\(output)")
                } header: {
                    Text("Output value")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Temperature Converter")
        }
    }

    func convertTemp(_ input: Double?) throws -> Double {
        guard let input else { return 0.0 }

        if inputType == outputType { return input }
        else {
            if inputType == .celsius {
                if outputType == .Fahrenheit {
                    return (input * 9 / 5) + 32
                } else if outputType == .Kelvin {
                    return input + 273.15
                } else {
                    throw UnitTypeError.notValidOutputType
                }
            } else if inputType == .Fahrenheit {
                if outputType == .celsius {
                    return (input - 32) * 5 / 9
                } else if outputType == .Kelvin {
                    return ((input - 32) * 5 / 9) + 273.15
                } else {
                    throw UnitTypeError.notValidOutputType
                }
            } else if inputType == .Kelvin {
                if outputType == .celsius {
                    return input - 273.15
                } else if outputType == .Fahrenheit {
                    return (input - 273.15) * 9 / 5 + 32
                } else {
                    throw UnitTypeError.notValidOutputType
                }
            } else {
                throw UnitTypeError.notValidInputType
            }
        }
    }
}

struct TemperatureConverter_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureConverter()
    }
}
