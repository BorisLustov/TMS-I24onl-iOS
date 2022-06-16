import UIKit

// HomeWork (Lesson 4)

/// The function of creating an array of tuples
func arrayOfTuples(numOfTuples num: Int) -> [(Int, String)] {
    let abc = "abcdefghigklmnopqrstuvwxyz"
    var resultArray = [(Int, String)]()
    for _ in 1...num {
        resultArray.append(
            (Int.random(in: 1...26), String(abc.randomElement() ?? " "))
        )
    }
    return resultArray
}

/// The function of converting an array of tuples (to square Int, filter out even elements, strings in alphabetical order)
func modifiedArrayOfTuples(_ array: [(Int, String)]) -> [(Int, String)] {
    let resultArray = array
        .map { (($0.0 * $0.0), $0.1) }
        .filter { ($0.0).isMultiple(of: 2) }
        .sorted { $0.1 < $1.1 }
    return resultArray
}

print(modifiedArrayOfTuples([(1, "z"), (2, "y"), (3, "x"), (4, "w"), (5, "v"), (6, "u")]))

let array = arrayOfTuples(numOfTuples: 15)
print(modifiedArrayOfTuples(array))





