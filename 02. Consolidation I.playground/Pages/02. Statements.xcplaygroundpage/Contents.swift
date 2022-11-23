/*
 Conditions
 */
let age = 16

if age < 12 {
    print("You can't vote")
} else if age < 18 {
    print("You can vote soon.")
} else {
    print("You can vote now.")
}

// &&: AND, ||:OR
let temp = 26

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}


/*
 Switch statements
 */
enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("A nice day.")
case .rain:
    print("Pack an umbrella.")
default:
    print("Should be okay.")
}


/*
 The ternary conditional operator
 */
let age2 = 18
let canVote = age >= 18 ? "Yes" : "No"


/*
 Loops
 */
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

// 배열의 값을 하나씩 가져와서 for문
for os in platforms {
    print("Swift works on \(os).")
}

// 정수 이상 이하 범위
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// 정수 이상 미만 범위
for i in 1..<13 {
    print("5 x \(i) is \(5 * i)")
}

// for문 내부에서 값이 필요 없을 때 _ 사용
var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

// while loops
var count = 10

while count > 0 {
    print("\(count)…")
    count -= 1
}
print("Go!")

// continue: 지금 loop iteration을 넘길 때 사용
let files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
    if file.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(file)")
}
