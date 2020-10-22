import Foundation
//This answer was provided by Giovanni Catania in 2017, but updated by Nandan here in 2020 : If you try to compare characters instead of UInt8 as done below, you will recieve a timeout error.
/// LOGIC:
/// From the end of the string, find the first character , which is smaller than the next one (you are trying to obtain a sorted  substring  which is sorted in descending order),
/// replace that character with the first character which is bigger than or equal to the said character. here swap is used.
/// then reverse the substring. you will get the desired result

// note that if the string is already sorted in the descending order, or if the string has a length of 1, then there is no answer.

func minLexicographicallyBigger(word: [UInt8]) -> String? {
    var chars = word
    var i: Int = chars.count - 1
    while i > 0 && chars[i - 1] >= chars[i] { i -= 1}
    guard i > 0 else { return nil }

    var j: Int = chars.count - 1
    while chars[j] <= chars[i - 1] { j -= 1 }
    chars.swapAt(i - 1, j)

    j = chars.count - 1
    while i < j {
        chars.swapAt(i, j)
        i += 1
        j -= 1
    }
    return String(bytes: chars, encoding: String.Encoding.utf8)
}

let numberOfTests: Int = Int(readLine()!) ?? 0

for _ in 1...numberOfTests {
    let word = [UInt8](readLine()!.utf8)
    if let minLexicographicallyBiggerWord = minLexicographicallyBigger(word:word) {
        print(minLexicographicallyBiggerWord)
    } else {
        print("no answer")
    }
}
