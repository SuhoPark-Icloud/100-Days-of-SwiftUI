func printSquare(of number: Int?) {
    // 옵셔널에 값이 없으면 중괄호 내부 코드 사용
    // 반면, if let 구문은 값이 있으면 중괄호 내부 사용
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}
