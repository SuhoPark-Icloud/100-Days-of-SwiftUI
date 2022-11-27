/*
 Protocols
 */
protocol Vehicle {
    // get: constant or computed property
    var name: String { get }
    // get set: variable or computed property with getter and setter
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)


/*
 Extensions
 */
import Foundation

// extension을 활용하여 모든 유형에 함수를 추가할 수 있다.
extension String {
    // ~~ed()로 끝나는 함수는 변경된 결과를 return으로 제공
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmed()

extension String {
    // ~~ed()와 달리 동사로 바로 끝나는 함수는 해당 인스턴스 자체를 변경하는 함수
    mutating func trim() {
        self = self.trimmed()
    }
}
quote.trim()

// extension을 통해 계산된 속성 추가 가능
extension String {
    var lines: [String] {
        // components(separatedBy:) 우리가 선택한 경계를 사용하여 문자열을 배열로 분할
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
"""

print(lyrics.lines.count)


/*
 Protocol extensions
 */
// 프로토콜 확장은 전체 프로토콜을 확장하여 계산된 속성 및 메서드 구현을 추가하므로 해당 프로토콜을 준수하는 모든 유형이 이를 가져옴
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

// 프로토콜 확장 내부에 해당 메서드의 기본 구현을 추가할 수 있음
