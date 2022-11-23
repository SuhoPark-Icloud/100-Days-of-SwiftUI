import Foundation

var quote = "   The truth is rarely pure and never simple   "

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

// 확장을 통해 구현
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // 확장을 사용하여 값 자체를 변환시킬 수 있음
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let trimmed2 = quote.trimmed()

// 전역 함수를 통해 구현
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed3 = trim(quote)

// 확장의 장점
// 1. 추가 기능을 쉽게 찾을 수 있다.
// 2. 전역 함수는 코드가 다소 지저분해짐. 반면 확장은 데이터 유형별로 자연스럽게 그룹화 됨.
// 3. 확장 메서드는 형식의 내부 데이터에 대한 전체 액세스 권한을 가짐.(private)

quote.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178)

let book1 = Book(title: "부자 아빠 가난한 아빠", pageCount: 1000, readingHours: 36)
