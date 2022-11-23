let platforms = ["iOS", "macOS", "tvOS", "watchOS"]


// for plat까지만 입력하면 아래 내용 자동 완성
for platform in platforms {
    print("Swift works great on \(platform).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }
    
    // 빈 줄 만들기
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

let names = ["Piper", "Alex", "Suzanne", "Gloria"]


//print(names[1...3])
// 1부터 끝까지 읽으라
print(names[1...])
