//
//  Divider.swift
//  Moonshot
//
//  Created by 박수호 on 2023/02/18.
//

import SwiftUI

struct Divider: View {
    var body: some View {
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
                .padding(.vertical)
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        Divider()
    }
}
