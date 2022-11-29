//
//  ContentView.swift
//  WeSplit
//
//  Created by 박수호 on 2022/11/27.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        // NavigationView
        //  1. 상단에 제목을 배치할 수 있는 공강 제공
        //  2. iOS가 새 뷰에서 슬라이드 할 수 있도록 함
        NavigationView {
            Form {
                // $checkAmount를 text에 바로 입력하는 것은 String 형식과 일치하지 않아서 불가
                // value: , format: init으로 수행 가능
                // "USD를 사용하지 않는 사람이 많음
                // Locale: 사용자의 모든 지역 설정을 저장하는 iOS의 구조체
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad) // 키보드를 강제하는 법
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    // 두 번째 후행 클로저 사용
                    Text("How much tip do you want to leave?")
                }

                
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            // Form의 수정자로 사용하는 이유: NavigationView가 많은 View를 표시할 수 있기 때문
            // 내부의 항목에 제목을 첨부하면 iOS에서 제목을 자유롭게 변경할 수 있음
        }
    }
}

// Option+Cmd+P: 미리보기 다시 시작
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
