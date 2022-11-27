/*
 Optionals
 */
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

// 대표적인 unwrapping 방법
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


/*
 Unwrapping optionals with guard
 */
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}


/*
 Nil coalescing
 */
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

let input = ""
let number = Int(input) ?? 0
print(number)


/*
 Optional chaining
 */
let names = ["Arya", "Bran", "Robb", "Sansa"]

// ?. nil이 아니라면 뒤 속성 혹은 메서드 실행
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")")


/*
 Optional try?
 */
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
