import Foundation

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOppsite = opposites["Mario"] {
    print("마리오의 반대는 \(marioOppsite)이다.")
}

var username: String? = nil

// if let 속어 구문
if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

// 옵셔널을 언래핑할 때 동일한 이름의 상수로 지정하는 것은 매우 일반적
// Shadowing: if 문 내부에서만 사용하는 상수를 지정
if let number = number {
    print(square(number: number))
}

func getUsername() -> String? {
    "Taylor"
}

if let username = getUsername() {
    print("Username is \(username)")
} else {
    print("No username")
}
