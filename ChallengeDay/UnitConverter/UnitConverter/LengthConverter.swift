//
//  LengthConverter.swift
//  UnitConverter
//
//  Created by 박수호 on 2023/09/13.
//

import SwiftUI

struct LengthConverter: View {
    enum Lengths: String, CaseIterable, Identifiable {
        case meters, kilometers, feet, yards, miles
        var id: Self { self }
    }

    @State private var input: Double?
    private var output: Double {
        return convertLength(input)
    }

    @State private var inputType: Lengths = .meters
    @State private var outputType: Lengths = .kilometers

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Unit Type", selection: $inputType) {
                        ForEach(Lengths.allCases) {
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
                        ForEach(Lengths.allCases) {
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
            .navigationTitle("Length Converter")
        }
    }

    func convertLength(_ input: Double?) -> Double {
        guard let input else { return 0.0 }

        var input_meter: Double {
            switch inputType {
            case .meters:
                return input
            case .kilometers:
                return input * 1000
            case .feet:
                return input * 0.3048
            case .yards:
                return input * 0.9144
            case .miles:
                return input * 1609.344
            }
        }

        switch outputType {
        case .meters:
            return input_meter
        case .kilometers:
            return input_meter / 1000
        case .feet:
            return input_meter / 0.3048
        case .yards:
            return input_meter / 0.9144
        case .miles:
            return input_meter / 1609.344
        }
    }
}

struct LengthConverter_Previews: PreviewProvider {
    static var previews: some View {
        LengthConverter()
    }
}
