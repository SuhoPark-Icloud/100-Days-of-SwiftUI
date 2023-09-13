//
//  TimeConverter.swift
//  UnitConverter
//
//  Created by 박수호 on 2023/09/13.
//

import SwiftUI

struct TimeConverter: View {
    enum Times: String, CaseIterable, Identifiable {
        case seconds, minutes, hours, days
        var id: Self { self }
    }

    @State private var input: Double?
    private var output: Double {
        return convertLength(input)
    }

    @State private var inputType: Times = .seconds
    @State private var outputType: Times = .minutes

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Unit Type", selection: $inputType) {
                        ForEach(Times.allCases) {
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
                        ForEach(Times.allCases) {
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
            .navigationTitle("Time Converter")
        }
    }

    func convertLength(_ input: Double?) -> Double {
        guard let input else { return 0.0 }

        var input_second: Double {
            switch inputType {
            case .seconds:
                return input
            case .minutes:
                return input * 60
            case .hours:
                return input * 60 * 60
            case .days:
                return input * 60 * 60 * 24
            }
        }

        switch outputType {
        case .seconds:
            return input_second
        case .minutes:
            return input_second / 60
        case .hours:
            return input_second / 60 / 60
        case .days:
            return input_second / 60 / 60 / 24
        }
    }
}

struct TimeConverter_Previews: PreviewProvider {
    static var previews: some View {
        TimeConverter()
    }
}
