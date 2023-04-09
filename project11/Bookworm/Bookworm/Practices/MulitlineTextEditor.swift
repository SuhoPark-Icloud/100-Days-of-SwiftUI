//
//  MulitlineTextEditor.swift
//  Bookworm
//
//  Created by 박수호 on 2023/04/09.
//

import SwiftUI

struct MulitlineTextEditor: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct MulitlineTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        MulitlineTextEditor()
    }
}
