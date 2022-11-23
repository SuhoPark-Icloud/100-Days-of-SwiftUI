let names = ["Arya", "Bran", "Robb", "Sansa"]

// (?.): 옵셔널이 내부에 값을 가지고 있다면, 언래핑하고...
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// 옵셔널 체이닝의 마법은 옵셔널이 비어 있으면 자동으로 아무것도 하지 않는다.

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)
