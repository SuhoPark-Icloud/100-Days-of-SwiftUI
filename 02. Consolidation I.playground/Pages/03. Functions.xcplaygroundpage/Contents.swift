/*
 Functions
 */
// 함수 정의
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

// 반환값이 있는 함수 정의
func rollDice() -> Int {
//    return Int.random(in: 1...6)
    // 한 줄로된 함수는 return 생략 가능
    Int.random(in: 1...6)
}

let result = rollDice()
print(result)


/*
 Returning multiple values from functions
 */
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

// 튜플 중 일부 값만 받을 수도 있다.
let (firstName, _) = getUser()
print("Name: \(firstName)")


/*
 Customizing parameter labels
 */
// _(언더바)를 사용하여 함수 호출 시 매개변수 이름 생략 가능
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string)

// 호출 시 사용하는 두번째 이름 사용 가능
func printTimesTables(for number: Int) {
    for i in 1...12 {
            print("\(i) x \(number) is \(i * number)")
        }
}

printTimesTables(for: 5)


/*
 Providing default values for parameters
 */
func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)")
    } else {
        print("Hi, \(person)!")
    }
}

greet("Tim", formal: true)
greet("Taylor")


/*
 Handling error in functions
 */
// 에러 enum 정의
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

let obviousPassword = "12345"

do {
    let result = try checkPassword(obviousPassword)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}


/*
 Closures
 */
// 함수를 마치 상수나 변수처럼 정의할 수 있다.
// 아래 sayHello는 '클로저'이다.
let sayHello = {
    print("Hi there!")
}

sayHello()

// 클로저에서 매개변수 허용하기 위해서 중괄호 내부에 정의해야 함
// in: 매개변수 및 반환값의 끝을 표시하고 이후 본문 시작
let sayHelloWithName = { (name: String) -> String in
    "Hi \(name)!"
}

// filter(): 배열의 각 항목들에 대해 수행하며 true가 되는 조건의 새 배열을 생성하는 메서드
let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})


/*
 Trailing closures and shorthand syntax
 (후행 클로저 및 속기 구문)
 */
// filter()는 사전 정의된 클로저 유형이 있기 때문에 다시 정의할 필요가 없다.
let onlyT2 = team.filter({ name in
    name.hasPrefix("T")
})

// 후행 클로저 구문
let onlyT3 = team.filter { name in
    name.hasPrefix("T")
}

// 짧은 파라미터 이름을 제공: $0, $1, ...
// -> name in 작성 필요 X
let onlyT4 = team.filter {
    $0.hasPrefix("T")
}
