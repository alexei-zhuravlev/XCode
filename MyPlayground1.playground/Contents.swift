import UIKit

let stringInput = "Следующую подсказку ждите завтра."
let charactersToRemove: [Character] = ["С", "ю", "а", "о", "с", " "]
var cipher = ""
 
for character in stringInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        cipher.append(character)
    }
}
print(cipher)

cipher.count


