let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

// 후행 클로저
let captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
            return true
        } else if name2 == "Suzanne" {
            return false
        }

        return name1 < name2
}

// 속기 구문(shorthand syntax)
let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
