protocol Building {
    var roomCount: Int { get set }
    var price: Int { get set }
    var nameOfAgent: String { get }
    func printSummary()
}

extension Building {
    func printSummary() {
        print("\(nameOfAgent)가 판매하는 집입니다.")
        print("방이 \(roomCount)개 있는 건물이며, 가격은 $\(price)입니다.")
    }
}

struct House: Building {
    var roomCount: Int
    var price: Int
    let nameOfAgent: String
}

struct Office: Building {
    var roomCount: Int
    var price: Int
    var nameOfAgent: String
}

let myHouse = House(roomCount: 4, price: 1_000_000, nameOfAgent: "수호")
myHouse.printSummary()
