//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 박수호 on 2022/12/03.
//

import SwiftUI

struct ContentView: View {
    @State private var alertTitle = ""
    @State private var isCorrect = false
    @State private var isWrong = false
    @State private var isGameCompleted = false
    
    let maxRound = 8
    @State private var round = 1
    
    private let correctScore = 10
    private let wrongScore = -5
    @State private var totalScore = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    // shuffled(): 자동으로 배열 순서를 섞음
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectedCountry = ""
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            
            VStack {
                // 크기가 큰 화면에서 각 항목들이 너무 벌어지지 않게끔 하는 효과
                // 실제로 크기가 작은 화면에서는 그 효과가 미비하게 나타날 수 있다.
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        // .weight(): 요청하는 글꼴에 수정자를 추가하여 세밀하게 제어 가능
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        // .largeTitle: iOS에서 제공하는 가장 큰 내장 글꼴
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original) // 원래 이미지 픽셀 그대로 렌더링
                                .clipShape(Capsule()) // 캡슐 이미지 형태로 수정
                                .shadow(radius: 5) // 그림자 설정
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Round \(round) / \(maxRound)")
                    .foregroundColor(.white)
                    .font(.headline)
                Text("Score: \(totalScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(alertTitle, isPresented: $isCorrect) {
            Button("Continue", action: askQuestionWhenCorrect)
        } message: {
            Text("You've got 10 points.")
        }
        .alert(alertTitle, isPresented: $isWrong) {
            Button("Continue", action: askQuestionWhenWrong)
        } message: {
            Text("That's the flag of \(selectedCountry).")
        }
        .alert(alertTitle, isPresented: $isGameCompleted) {
            Button("Continue") {
                totalScore = 0
            }
        } message: {
            Text("Your final score is \(totalScore)!")
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedCountry = countries[number]
        
        if number == correctAnswer {
            alertTitle = "Correct!"
            isCorrect = true
        } else {
            alertTitle = "Wrong!"
            isWrong = true
        }
    }
    
    func prepareForNextRound() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        round += 1
    }
    
    func prepareForFinalRound() {
        if (maxRound + 1) == round {
            alertTitle = "Rounds Complete!"
            round = 1
            isGameCompleted = true
        }
    }
    
    func askQuestionWhenCorrect() {
        prepareForNextRound()
        totalScore += correctScore
        prepareForFinalRound()
    }
    
    func askQuestionWhenWrong() {
        prepareForNextRound()
        totalScore += wrongScore
        prepareForFinalRound()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
