/*
 Classes
 */
// 차이점 1. 상속 가능
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm coding for \(hours) hours.")
    }
    
    // override: 부모 클래스의 메서드 변경
    override func printSummary() {
        print("I spend \(hours) hours a day searching Stack Overflow.")
    }
}

let novall = Developer(hours: 8)
novall.work()
novall.printSummary()

// 차이점 2. 이니셜라이저가 더 까다롭다.
//  - 클래스에 대한 멤버 단위 초기화를 생성하지 X
//  - 자식 클래스에 사용자 지정 초기화가 있는 경우 자체 속성 설정을 마친 후 항상 부모의 초기화를 호출해야 함
//  - 하위 클래스에 이니셜라이저가 없으면 자동으로 부모 클래스의 이니셜라이저 상속
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        // super: 부모 클래스에 속하는 메서드 호출
        super.init(isElectric: isElectric)
    }
}

// 차이점 3. 클래스 인스턴스의 모든 복사본이 데이터를 공유한다.
class Singer {
    var name = "Adele"
}

var singer1 = Singer()
var singer2 = singer1
singer2.name = "Justin"
print(singer1.name)
print(singer2.name)

// 차이점 4. 개체에 대한 마지막 참조가 소멸될 때 호출되는 초기화 해제자(deinit)를 가질 수 있다.
class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

// 차이점 5. 클래스 자체가 상수인 경우에도 변수 속성 변경 가능(mutating 메서드 필요 없음)
class User2 {
    var name = "Paul"
}

let user = User2()
user.name = "Taylor"
print(user.name)
