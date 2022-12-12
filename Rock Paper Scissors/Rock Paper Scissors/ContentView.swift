//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by 박수호 on 2022/12/10.
//

import SwiftUI

struct ContentView: View {
    let moves = ["👊🏻", "🤚🏻", "✌🏻"]
    let winMoves = ["🤚🏻", "✌🏻", "👊🏻"]
    let loseMoves = ["✌🏻", "👊🏻", "🤚🏻"]
    
    @State private var round = 1
    let maxRound = 10
    
    @State private var totalScore = 0
    let correctScore = 10
    let wrongScore = -5
    
    @State private var aiPick = Int.random(in: 0...2)
    @State private var winOrLose = Bool.random()
    
    @State private var isCorrect = false
    @State private var isWrong = false
    @State private var isGameCompleted = false
    
    
    var body: some View {
        VStack {
            Spacer()
            if !isRoundCompleted() {
                Text("Round \(round) / \(maxRound)")
            } else {
                Text("Round Complete!")
            }
            Spacer()
            Text(moves[aiPick])
                .padding()
            Text(winOrLose ? "Win" : "Lose")
                .padding()
            HStack {
                ForEach(0..<3) { playerPick in
                    Button {
                        correctOrWrong(playerPick)
                    } label: {
                        Text(moves[playerPick])
                    }
                }
                .padding()
            }
            .padding()
            Spacer()
            
        }
        .font(.largeTitle)
        .alert("Correct", isPresented: $isCorrect) {
            Button("Continue") {
                prepareGame()
            }
        }
        .alert("Wrong", isPresented: $isWrong) {
            Button("Continue") {
                prepareGame()
            }
        }
        .alert("Complete", isPresented: $isGameCompleted) {
            Button("Restart") {
                round = 1
                totalScore = 0
            }
        } message: {
            Text("Your final score is \(totalScore)")
        }
    }
    
    func correctOrWrong(_ playerPick: Int) {
        if (winOrLose ? winMoves[aiPick] : loseMoves[aiPick]) == moves[playerPick] {
            isCorrect = true
        } else {
            isWrong = true
        }
    }
    
    func prepareGame() {
        round += 1
        
        if isCorrect {
            totalScore += correctScore
        }
        if isWrong {
            totalScore += wrongScore
        }
        
        if !isRoundCompleted() {
            aiPick = Int.random(in: 0...2)
            winOrLose.toggle()
        } else {
            isGameCompleted = true
        }
    }
    
    func isRoundCompleted() -> Bool {
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
