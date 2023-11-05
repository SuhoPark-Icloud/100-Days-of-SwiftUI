//
//  RowText.swift
//  KeyPoints
//
//  Created by Suho Park on 11/5/23.
//

import SwiftUI

struct RowText<T>: View where T: CustomStringConvertible {
    let key: String
    let value: T
    var body: some View {
        HStack {
            Text(key)
            Spacer()
            Text(value.description)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    RowText(key: "Name", value: "Suho's iPhone")
}
