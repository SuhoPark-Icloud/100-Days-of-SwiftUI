struct Vehicle {
    let model: String
    let numSeat: Int
    private(set) var currentGear: Int
    
    init(model: String, numSeat: Int) {
        self.model = model
        self.numSeat = numSeat
        currentGear = 1
    }
    
    mutating func increaseGear()  -> Bool {
        if currentGear < 10 {
            currentGear += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func decreaseGear() -> Bool {
        if currentGear <= 1 {
            return false
        } else {
            currentGear -= 1
            return true
        }
    }
}

var myCar = Vehicle(model: "Tucson", numSeat: 5)

for _ in 1...20 {
    myCar.increaseGear()
}
print(myCar)

for _ in 1...20 {
    myCar.decreaseGear()
}
print(myCar)
