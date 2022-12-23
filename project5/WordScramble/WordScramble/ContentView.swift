//
//  ContentView.swift
//  WordScramble
//
//  Created by 박수호 on 2022/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
    
    func test() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        // Objective-C에는 옵셔널의 개념이 없었기 때문에 특수한 값인 NSNotFound을 통해 철자에 문제가 없는지 확인할 수 있음
        let allGood = misspelledRange.location == NSNotFound
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
