//
//  VolumnConverter.swift
//  UnitConverter
//
//  Created by 박수호 on 2023/09/13.
//

import SwiftUI

struct VolumnConverter: View {
    enum Volumes: String, CaseIterable, Identifiable {
        case liters, cups, pints, gallons
        var id: Self { self }
    }

    @State private var input: Double?
    private var output: Double {
        return convertLength(input)
    }

    @State private var inputType: Volumes = .liters
    @State private var outputType: Volumes = .cups

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Unit Type", selection: $inputType) {
                        ForEach(Volumes.allCases) {
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
                        ForEach(Volumes.allCases) {
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
            .navigationTitle("Volumn Converter")
        }
    }

    func convertLength(_ input: Double?) -> Double {
        guard let input else { return 0.0 }

        var input_liter: Double {
            switch inputType {
            case .liters:
                return input
            case .cups:
                return input * 0.2365882365
            case .pints:
                return input * 0.473176473
            case .gallons:
                return input * 3.7854118
            }
        }

        switch outputType {
        case .liters:
            return input_liter
        case .cups:
            return input_liter / 0.2365882365
        case .pints:
            return input_liter / 0.473176473
        case .gallons:
            return input_liter / 3.7854118
        }
    }
}

struct VolumnConverter_Previews: PreviewProvider {
    static var previews: some View {
        VolumnConverter()
    }
}
