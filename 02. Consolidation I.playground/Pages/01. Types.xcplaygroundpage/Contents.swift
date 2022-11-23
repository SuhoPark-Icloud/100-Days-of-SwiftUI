/*
 Creating constants and variables
 */
// 변수
var name = "Ted"
name = "Rebecca"

// 상수
let user = "Daphne"

print(user)


/*
 Strings
 */
// 이모지도 함께 사용할 수 있다.
let actor = "Tom Cruise 🏃‍♂️"

// 문자열 내부에 "를 사용하고 싶다면 \뒤에 붙여서 사용할 수 있다.
let quote = "He tapped a sign saying \"Believe\" and walked away."

// 여러 줄에 걸쳐 있는 문자열의 경우 세 개의 큰따옴표로 시작하고 끝내기
let movie = """
A day in
the life of an
Apple engineer
"""

// .count: 문자열의 개수
print(actor.count)

// 문자열이 특정 문자로 시작하는지, 끝나는지 알려주는 기능들
print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away.")) // 대소문자 구분으로 인해 false


/*
 Integers
 */
// 정수 표준 수학 연산자 지원
let score = 10
let higherScore = score + 10
let halvedScore = score / 2

// 복합 대입 연산자
var counter = 10
counter += 5

// isMultiple(of:): 본 정수가 ~의 배수인지 확인
let number = 120
print(number.isMultiple(of: 3))

// 랜덤 정수
let id = Int.random(in: 1...1000)


/*
 Decimals
 */
let score2 = 3.0

/*
 Booleans
 */
let goodDogs = true
let gameOver = false

var isSaved = false
isSaved.toggle()


/*
 Joining strings
 */
let name2 = "Taylor"
let age = 26
let message = "I'm \(name2) and I'm \(age) years old."
print(message)


/*
 Arrays
 */
var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]

// 데이터 가져오기
print(colors[0])
print(readings[2])

// append(): 배열에 새 항목을 추가하는데 사용
colors.append("Tartan")

// count: 배열의 항목 수
// remove(at:): 특정 인덱스의 항목 제거
colors.remove(at: 0)
print(colors.count)

// contains(): 배열에 특정 항목이 있는지 확인
print(colors.contains("Octarine"))


/*
 Dictionaries
 */
let employee = [
    "name": "Taylor",
    "job": "Singer"
]

// default: 해당 키가 없는 경우 기본값 지정
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])


/*
 Sets
 */
var numberSet = Set([1, 1, 3, 5, 7])
print(numberSet)


/*
 Enums
 */
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .friday


/*
 Type annotations
 */
var score3: Double = 0
let player: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isEnabled: Bool = true
//var albums: Array<String> = ["Red", "Fearless"]
//var userDic: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

// 배열과 딕셔너리에서의 더 쉬운 방식
var albums: [String] = ["Red", "Fearless"]
var userDic: [String: String] = ["id": "@twostraws"]

// 빈 배열 정의
var teams: [String] = [String]()
var clues = [String]()
