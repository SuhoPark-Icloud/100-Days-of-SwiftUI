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
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
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
            Button("Continue", action: prepareWhenCorrect)
        } message: {
            Text("You've got 10 points.")
        }
        .alert(alertTitle, isPresented: $isWrong) {
            Button("Continue", action: prepareWhenWrong)
        } message: {
            Text("That's the flag of \(selectedCountry).")
        }
        .alert(alertTitle, isPresented: $isGameCompleted) {
            Button("Restart") {
                prepareForNextRound()
                round = 1
                totalScore = 0
            }
        } message: {
            Text("Your final score is \(totalScore)!")
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedCountry = countries[number]

        if (round < maxRound) {
            if number == correctAnswer {
                alertTitle = "Correct!"
                isCorrect = true
            } else {
                alertTitle = "Wrong!"
                isWrong = true
            }
        } else {
            alertTitle = "Complete!"
            if number == correctAnswer {
                totalScore += correctScore
            } else {
                totalScore += wrongScore
            }
            isGameCompleted = true
        }
    }
    
    func prepareForNextRound() {
        round += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func prepareWhenCorrect() {
        prepareForNextRound()
        totalScore += correctScore
    }
    
    func prepareWhenWrong() {
        prepareForNextRound()
        totalScore += wrongScore
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
