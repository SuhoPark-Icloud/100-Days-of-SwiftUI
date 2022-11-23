let score = 85

if score > 80 {
    print("Great job!")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)

// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" { // "": 빈 문자열
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// 빈 문자열인지 확인하는 동일한 방법
// 그러나 이는 비효율적이다.
// count를 호출함으로써 문자열의 모든 개수를 세야 하기 때문이다.
if username.count == 0 {
    username = "Anonymous"
}

// isEmpty: 비어 있는지 단순 확인 (더 효율적)
if username.isEmpty == true {
    username = "Anonymous"
}

// isEmpty의 결과는 이미 부울값이기 때문에 true와 비교할 필요가 없다.
if username.isEmpty {
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")
