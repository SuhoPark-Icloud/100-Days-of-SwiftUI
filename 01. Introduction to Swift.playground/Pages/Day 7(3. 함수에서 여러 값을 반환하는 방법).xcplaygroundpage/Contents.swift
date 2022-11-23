//func getUser() -> (firstName: String, lastName: String) {
//    (firstName: "Taylor", lastName: "Swift")
//}

func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
print("Name: \(user.0) \(user.1)")

let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

let (firstName2, _) = getUser()
print("Name: \(firstName2)")
