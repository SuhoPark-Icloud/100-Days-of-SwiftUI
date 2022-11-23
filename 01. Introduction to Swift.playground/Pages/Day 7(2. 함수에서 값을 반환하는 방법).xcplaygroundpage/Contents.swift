import Foundation

func rollDice() -> Int {
    Int.random(in: 1...6)
}

let result = rollDice()
print(result)

//func areLettersIdentical(string1: String, string2: String) -> Bool {
//    let first = string1.sorted()
//    let second = string2.sorted()
//    return first == second
//}

// 함수가 한 줄로 이루어져 있다면 return 키워드를 생략할 수 있다.
func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

areLettersIdentical(string1: "Suho", string2: "houS")

//func pythagoras(a: Double, b: Double) -> Double {
//    let input = a * a + b * b
//    let root = sqrt(input)
//    return root
//}

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

func returnTest() {
    print(1)
    return;
    // 함수를 강제로 조기 종료할 때 return 뒤에 ;를 붙여야 argument로 인지하지 않는다.
//    print(2.0)
}

let c = pythagoras(a: 3, b: 4)
print(c)

returnTest()

// 삼항 연산자를 사용하면 한줄의 코드로 만들 수 있고 return 생략 가능
func greet(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}

greet(name: "Taylor Swift")
