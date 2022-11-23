enum SqrtError: Error {
    case noRoot, outOfBounds
}

func getSqrt(for number: Int) throws -> Int {
    if number > 10_000 {
        throw SqrtError.outOfBounds
    }
    
    for i in 1...100 {
        if number == (i * i) {
            return i
        }
    }
    
    throw SqrtError.noRoot
}

let testNumber = 10000

do {
    let result = try getSqrt(for: testNumber)
    print("\(testNumber)의 제곱근은 \(result)이다.")
} catch SqrtError.noRoot {
    print("There is no root.")
} catch SqrtError.outOfBounds {
    print("Input is out of bounds.")
} catch {
    print("There was an error.")
}
