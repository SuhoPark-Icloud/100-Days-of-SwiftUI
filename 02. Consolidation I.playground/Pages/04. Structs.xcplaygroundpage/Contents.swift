/*
 Structs
 */
struct Album {
    let title: String
    let artist: String
    var isReleased = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
    
    // 해당 속성 중 하나라도 변경하려면 mutating 입력 필요
    mutating func removeFromSale() {
        isReleased = false
    }
}

// Swift가 멤버 단위 초기화를 자동으로 생성
// 마치 구조체를 함수처럼 사용할 수 있도록 해줌
let red = Album(title: "Red", artist: "Taylor")
print(red.title)
red.printSummary()


/*
 Computed properties
 */
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // 계산된 속성은 액세스할 때마다 계산됨
    // 만약 '쓰기'를 하고 싶다면 getter, setter 모두 제공해주어야 함
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            // newValue: 사용자가 속성에 할당한 모든 값을 저장
            vacationAllocated = vacationTaken + newValue
        }
    }
}


/*
 Property observers
 */
// disSet: 프로퍼티가 변경된 직후 실행
// willSet: 프로퍼티가 변경되기 직전 실행
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3


/*
 Custom initializers
 */
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}


/*
 Access control
 */
// private: 구조체 외부에서 접근 불가
// private(set): 외부에서 읽기만 가능
// fileprivate: 파일 외부에서 접근 불가
// public: 어디서든 접근 가능
struct BankAccount {
    // 외부에서도 읽기 가능
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}


/*
 Static properties and methods
 */
struct AppData {
    static let version = "1.3 beta 2"
    static let settings = "settings.json"
}
// static 변수/상수는 인스턴스 없이 액세스 가능
let version = AppData.version
