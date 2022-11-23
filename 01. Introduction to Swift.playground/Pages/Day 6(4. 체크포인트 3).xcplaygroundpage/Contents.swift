for i in 1...100 {
    let isMultipleOf3 = i.isMultiple(of: 3)
    let isMultipleOf5 = i.isMultiple(of: 5)
    
    if !isMultipleOf3 && !isMultipleOf5 {
        print(i)
    } else if isMultipleOf3 && !isMultipleOf5 {
        print("Fizz")
    } else if !isMultipleOf3 && isMultipleOf5 {
        print("Buzz")
    } else {
        print("FizzBuzz")
    }
}
