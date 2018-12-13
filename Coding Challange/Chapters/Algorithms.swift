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
    print([12, 5, 4, 9, 3, 2, 1].quickSorted())
}
