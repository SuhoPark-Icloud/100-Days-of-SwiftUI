//
//  ContentView.swift
//  WeSplit
//
//  Created by 박수호 on 2022/11/27.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Ron"
    
    // ForEach: 배열이나 범위동안 많은 view를 생성할 수 있는 전용 view
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    // id: 배열의 각 항목을 고유하게 만드는 식별자
                    // \.self: 문자열 그 자체(중복 문자열이 있으면 X)
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

// Option+Cmd+P: 미리보기 다시 시작
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
