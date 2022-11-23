enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

// 혹은 아래처럼
//enum Weekday {
//    case monday, tuesday, wednesday, thursday, friday
//}



var day = Weekday.monday
day = Weekday.friday
day = .tuesday // 첫 번째 할당 후에 열거형 이름 건너뛸 수 있음
