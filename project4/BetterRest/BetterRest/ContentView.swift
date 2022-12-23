//
//  ContentView.swift
//  BetterRest
//
//  Created by 박수호 on 2022/12/10.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    // 기본 기상 시간을 7시로 설정
    // static을 설정하지 않으면 특정 property에서 다른 property를 불러올 수 없다.
    // static을 활용함으로서 인스턴스가 아닌 struct 자체에 종속되도록 설정
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            // VStack에서 Form으로 바꾸는 것만으로도 형태가 달라짐
            Form {
                Section {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .onAppear {
                            // 15분 간격으로 조정하기 위해서 사용
                            UIDatePicker.appearance().minuteInterval = 15
                        }
                } header: {
                    Text("When do you want to wake up?")
                }
                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                }
                
                Section {
                    Picker("coffee", selection: $coffeeAmount) {
                        ForEach(1..<22) { index in
                            let coffeeCnt = index - 1
                            Text("\(coffeeCnt) " + ((coffeeCnt <= 1) ? "cup" : "cups"))
                        }
                    }
                    .labelsHidden()
                } header: {
                    Text("Daily coffee intake")
                }
                
                Section {
                    Text(calculateBedtime())
                        .font(.largeTitle)
                } header: {
                    Text("The recommended bedtime is")
                }
                
            }
            .navigationTitle("BetterRest")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            // wakeUp의 시간 정보들의 일부를 가져오기 위해 사용
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            showingAlert = true
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
