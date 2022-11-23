func getRandomInt(_ numbers: [Int]?) -> Int {
    return numbers?.randomElement() ?? Int.random(in: 1...100)
}

let randomNumberFromNil = getRandomInt(nil)
let randomNumberFromArray = getRandomInt([1,3,4,5,6,6,7])
