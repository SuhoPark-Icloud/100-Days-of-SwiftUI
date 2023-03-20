//
//  DisabledFormView.swift
//  CupcakeCorner
//
//  Created by 박수호 on 2023/03/19.
//

import SwiftUI

struct DisabledFormView: View {
    @State private var username = ""
    @State private var email = ""
    
    var disabledForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disabledForm)
        }
    }
}

struct DisabledFormView_Previews: PreviewProvider {
    static var previews: some View {
        DisabledFormView()
    }
}
