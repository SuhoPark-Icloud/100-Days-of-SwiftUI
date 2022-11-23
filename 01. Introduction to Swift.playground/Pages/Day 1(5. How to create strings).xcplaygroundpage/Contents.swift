let actor = "Denzel Washinton"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"
let movie = """
A day in
the life of an
Apple engineer
"""

print(actor.count) // .count: 문자열의 길이를 읽을 수 있음

let nameLength = actor.count
print(nameLength)

print(result.uppercased()) // .uppercased(): 모든 문자를 대문자로 만들기
print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))
