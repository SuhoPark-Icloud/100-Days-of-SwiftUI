var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

beatles.append("Adrian")

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)

//var albums = Array<String>()
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2) // at에 존재하는 원소를 return
print(characters.count)

characters.removeAll() // 모두 제거
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen")) // 해당 원소가 배열 내부에 있는지 확인

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted()) // 원래 배열은 변경되지 않음
print(cities) // 기존 배열 순서 그대로

var presidents = ["Bush", "Obama", "Trump", "Biden"]
var reversedPresidents = presidents.reversed()
print(reversedPresidents)

// 추가로 저장하는 항목은 이전에 정의한 reversed() 배열에 영향을 끼치지 않음
presidents.append("Suho")
print(reversedPresidents)
