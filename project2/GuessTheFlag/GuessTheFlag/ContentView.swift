//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 박수호 on 2022/12/03.
//

import SwiftUI

struct FlagTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.white)
    }
}

extension View {
    func flagTitle() -> some View {
        modifier(FlagTitle())
    }
}

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var isCorrect = false
    @State private var isWrong = false
    @State private var isGameCompleted = false
    
    @State private var selectedFlag = -1
    
    private let maxRound = 8
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
                    .flagTitle()
                
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
                            withAnimation {
                                flagTapped(number)
                            }
                        } label: {
                            FlagImage(country: countries[number])
                                .rotation3DEffect(
                                    .degrees(selectedFlag == number
                                             ? 360 : 0 ),
                                    axis: (x: 0.0, y: 0.1, z: 0.0)
                                )
                                .opacity((selectedFlag == number || selectedFlag == -1) ? 1 : 0.25)
                                .scaleEffect((selectedFlag == number || selectedFlag == -1) ? 1 : 0.80)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                if !isGameComplete() {
                    Text("Round \(round) / \(maxRound)")
                        .foregroundColor(.white)
                        .font(.headline)
                } else {
                    Text("Round Complete!")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                Text("Score: \(totalScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert("Correct!", isPresented: $isCorrect) {
            Button("Continue", action: prepareWhenCorrect)
        } message: {
            Text("You've got 10 points.")
        }
        .alert("Wrong!", isPresented: $isWrong) {
            Button("Continue", action: prepareWhenWrong)
        } message: {
            Text("That's the flag of \(selectedCountry).")
        }
        .alert("Complete!", isPresented: $isGameCompleted) {
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
        selectedFlag = number
        
        if number == correctAnswer {
            isCorrect = true
        } else {
            isWrong = true
        }
    }
    
    func prepareWhenCorrect() {
        totalScore += correctScore
        prepareForNextRound()
    }
    
    func prepareWhenWrong() {
        totalScore += wrongScore
        prepareForNextRound()
    }
    
    func prepareForNextRound() {
        round += 1
        selectedFlag = -1
        
        if !isGameComplete() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        } else {
            isGameCompleted = true
        }
    }
    
    func isGameComplete() -> Bool {
        if round == (maxRound + 1) {
            return true
        } else {
            return false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
