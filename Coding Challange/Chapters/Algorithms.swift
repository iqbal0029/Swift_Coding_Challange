//
//  Algorithms.swift
//  Coding Challange
//
//  Created by Faisal Ikwal on 12/12/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation

/*
 Bubble sort
 */
func challenge55() {
    print([9, 3, 1, 0, 5].bubbleSorted())
}

/*
 Insertion sort
 */
func challenge56() {
    print([12, 5, 4, 9, 3, 2, 1, 78, 0].insertionSorted())
}

/*
 Write a function that accepts two values and returns true if they are isomorphic. That is, each
 part of the value must map to precisely one other, but that might be itself.
 Tip: Strings A and B are considered isomorphic if you can replace all instances of each letter with another. For example, “tort” and “pump” are isomorphic, because you can replace both Ts with a P, the O with a U, and the R with an M. For integers you compare individual digits, so 1231 and 4565 are isomorphic numbers. For arrays you compare elements, so [1, 2, 1] and [4, 8, 4] are isomorphic.
 Sample input and output
 These are all isomorphic values:
 • “clap” and “slap”
 • “rum” and “mud”
 • “pip” and “did”
 • “carry” and “baddy”
 • “cream” and “lapse”
 • 123123 and 456456
 • 3.14159 and 2.03048
 • [1, 2, 1, 2, 3] and [4, 5, 4, 5, 6]
 */
func challenge57(first firstValue: Any, second secondValue: Any) -> Bool {
    let first = String(describing: firstValue)
    let second = String(describing: secondValue)
    guard first.count == second.count else {
        return false
    }
    
    var characterMap = [Character: Character]()
    for (index, firstChar) in first.enumerated() {
        let secondChar = second.character(at: index)!
        if let mappedChar = characterMap[firstChar] {
            if mappedChar != secondChar {
                return false
            }
        } else {
            if characterMap.values.contains(secondChar) {
                return false
            }
            characterMap[firstChar] = secondChar
        }
    }
    return true
}

/*
 Write a function that accepts a string containing the characters (, [, {, <, >, }, ], and ) in any arrangement and frequency. It should return true if the brackets are opened and closed in the correct order, and if all brackets are closed. Any other input should false.
 Sample input and output
 • The string “()” should return true.
 • The string “([])” should return true.
 • The string “([])(<{}>)” should return true.
 • The string “([]{}<[{}]>)” should return true.
 • The string “” should return true.
 • The string “}{” should return false.
 • The string “([)]” should return false.
 • The string “([)” should return false.
 • The string “([” should return false.
 • The string “[<<<{}>>]” should return false.
 • The string “hello” should return false.
 */
func challenge58(input: String) -> Bool {
    let allowedCharacterSet = CharacterSet(charactersIn: "([{<>}])")
    guard input.rangeOfCharacter(from: allowedCharacterSet.inverted) == nil else {
        return false
    }

    let bracketPair: [Character: Character] = ["(": ")", "[": "]", "{": "}", "<": ">"]
    var usedOpenBrackets = [Character]()

    for currentChar in input {
        if bracketPair.keys.contains(currentChar) { //Open Bracket
            usedOpenBrackets.append(currentChar)
        } else { //Closed Bracket
            guard let lastOpenBracket = usedOpenBrackets.popLast() else {
                return false
            }
            if bracketPair[lastOpenBracket] != currentChar {
                return false
            }
        }
    }
    return usedOpenBrackets.count == 0
}

/*
 Quick sort
 */
func challenge59() {
    var array = [12, 5, 4, 9, 3, 2, 1]
    //print(array.quickSorted())
    array.qSort()
    print(array)
}

/*
 Create a function that detects whether either player has won in a game of Tic-Tac-Toe.
 Tip: A tic-tac-toe board is 3x3, containing single letters that are either X, O, or empty. A win is three Xs or Os in a straight line.
 Sample input and output
 • The array [["X", "", "O"], ["", "X", "O"], ["", "", "X"]] should return true.
 • The array [["X", "", "O"], ["X", "", "O"], ["X", "", ""]] should return true.
 • The array [["", "X", ""], ["O", "X", ""], ["O", "X", ""]] should return true.
 • The array [["", "X", ""], ["O", "X", ""], ["O", "", "X"]] should return false.
 • The array [["", "", ""], ["", "", ""], ["", "", ""]] should return false.
 */
func challenge60(input: [[String]]) -> Bool {
    guard input.count == 3, input.reduce(true, { $0 && $1.count==3 })
    else { return false }
    func isWin(_ first: String, _ second: String, _ third: String) -> Bool {
        return !first.isEmpty && first == second && first == third
    }

    for i in 0 ..< 3 {
        //row
        if isWin(input[i][0], input[i][1], input[i][2]) {
            return true
        }

        //column
        if isWin(input[0][i], input[1][i], input[2][i]) {
            return true
        }
    }

    //column from top left to bottom right
    let diagonal1 = isWin(input[0][0], input[1][1], input[2][2])

    //column from bottom left to top right
    let diagonal2 = isWin(input[0][2], input[1][1], input[2][0])
    return diagonal1 && diagonal2
}

/*
 Write a function that returns an array of prime numbers from 2 up to but excluding N, taking
 care to be as efficient as possible.
 */
func challenge61(upTo max: Int) -> [Int] {
    guard max > 1 else { return [] } //excluding max

    var sieve = [Bool](repeating: true, count: max)
    sieve[0] = false
    sieve[1] = false
    for number in 2 ..< max {
        if sieve[number] == true {
            for multipleOfNumber in stride(from: number*number, to: max, by: number) {
                sieve[multipleOfNumber] = false
            }
        }
    }
    return sieve.enumerated().compactMap { $0.element == true ? $0.offset : nil }
}

/*
 Write a function that accepts an array of CGPoint pairs, and returns an array of the angles
 between each point pair. Return the angles in degrees, where 0 or 360 is straight up.
 */
func challenge62() {
    
    func challenge62(points: [(first: CGPoint, second: CGPoint)]) -> [CGFloat] {
        return points.map {
            let radians = atan2($0.first.y - $0.second.y, $0.first.x
                - $0.second.x)
            var degrees = (radians * 180 / CGFloat.pi) - 90
            if (degrees < 0) { degrees += 360.0 }
            if degrees == 360 { degrees = 0 }
            return degrees
        }
    }

    var points = [(first: CGPoint, second: CGPoint)]()
    points.append((first: CGPoint.zero, second: CGPoint(x: 0, y:
        -100)))
    points.append((first: CGPoint.zero, second: CGPoint(x: 100, y:
        -100)))
    points.append((first: CGPoint.zero, second: CGPoint(x: 100, y:
        0)))
    points.append((first: CGPoint.zero, second: CGPoint(x: 100, y:
        100)))
    points.append((first: CGPoint.zero, second: CGPoint(x: 0, y:
        100)))
    points.append((first: CGPoint.zero, second: CGPoint(x: -100, y:
        100)))
    points.append((first: CGPoint.zero, second: CGPoint(x: -100, y:
        0)))
    points.append((first: CGPoint.zero, second: CGPoint(x: -100, y:
        -100)))
    print(challenge62(points: points))
}
