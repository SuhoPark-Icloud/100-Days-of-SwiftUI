func greetUser() {
    print("Hi there!")
}
greetUser()

// 함수 복사할 때 괄호 쓰지 않음
// Void 대신 ()을 사용할 수 있으나 빈 매개변수와 혼동을 피하기 위해 Void로 명시적 표시
//var greetCopy = greetUser
var greetCopy: () -> Void = greetUser
greetCopy()

// 클로저 표현식
// 클로저 표현식은 모두 중괄호 이내에 있어야 한다.
let sayHello = {
    print("Hi there!")
}
sayHello()

// 중괄호 내부에서 매겨 변수나 반환 값을 설정해주어야 한다.
// in 이전: 매개변수 및 return type
// in 이후: 클로저 함수 내용
let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}
print(sayHello2("Suho"))

// 클로저 함수에서는 매개변수 이름이 사용되지 않는다.
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989) // for: ~~ 없음!
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

// 1. 정의된 함수 이름을 전달할 수 있음
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// 2. 함수 대신 클로저 전달
let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
            return true
        } else if name2 == "Suzanne" {
            return false
        }

        return name1 < name2
})
print(captainFirstTeam2)

// 매개변수를 받지 않는 클로저 정의
let payment = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}
payment()
