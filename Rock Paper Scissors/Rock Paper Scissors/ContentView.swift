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
    
    @State private var aiPick = Int.random(in: 0...2)
    @State private var winOrLose = Bool.random()
    
    @State private var showWinAlert = false
    @State private var showLoseAlert = false
    
    
    var body: some View {
        VStack {
            Text(moves[aiPick])
            Text(winOrLose ? "Win" : "Lose")
            HStack {
                ForEach(0..<3) { playerPick in
                    Button {
                        determineWinOrLose(playerPick)
                    } label: {
                        Text(moves[playerPick])
                    }
                }
            }
        }
        .font(.largeTitle)
        .alert("Correct", isPresented: $showWinAlert) {
            Button("Continue") {
                prepareGame()
            }
        }
        .alert("Wrong", isPresented: $showLoseAlert) {
            Button("Continue") {
                prepareGame()
            }
        }
    }
    
    func determineWinOrLose(_ playerPick: Int) {
        if winOrLose {
            if winMoves[aiPick] == moves[playerPick] {
                showWinAlert = true
            } else {
                showLoseAlert = true
            }
        } else {
            if loseMoves[aiPick] == moves[playerPick] {
                showWinAlert = true
            } else {
                showLoseAlert = true
            }
        }
    }
    
    func prepareGame() {
        aiPick = Int.random(in: 0...2)
        winOrLose.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
