//
//  Strings.swift
//  Coding Challange
//
//  Created by Faisal Ikwal on 27/11/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation
/*
 Write a function that accepts a String as its only parameter, and returns true if the string has
 only unique letters, taking letter case into account.
 */
func challenge1(input: String) -> Bool {
    return input.count == Set(input).count
}

/*
 Write a function that accepts a String as its only parameter, and returns true if the string
 reads the same when reversed, ignoring case.
 */
func challenge2(input: String) -> Bool {
    var forwardIndex = 0, backwardIndex = input.count-1
    //O(n*k) space O(1)
    /*while forwardIndex < backwardIndex{
     if String(input.character(at: forwardIndex)!).lowercased() != String(input.character(at: backwardIndex)!).lowercased() {
     return false
     }
     forwardIndex += 1
     backwardIndex -= 1
     }
     return true*/
    //O(n) space O(n)
    /*let inputArray = Array(input)
     while forwardIndex < backwardIndex{
     if String(inputArray[forwardIndex]).lowercased() != String(inputArray[backwardIndex]).lowercased() {
     return false
     }
     forwardIndex += 1
     backwardIndex -= 1
     }
     return true*/
    //O(n) space O(n)
    let lowerCased = input.lowercased()
    return Array(lowerCased) == Array(lowerCased.reversed())
    
}

/*
 Write a function that accepts two String parameters, and returns true if they contain the same characters in any order taking into account letter case.
 */
func challenge3(s1: String, s2: String) -> Bool {
    guard s1.count == s2.count else { return false } //no need
    //return Set(s1) == Set(s2)
    return s1.sorted() == s2.sorted()
    //return true
}

/*
 Write your own version of the contains() method on String that ignores letter case, and
 without using the existing contains() method.
 */
func challenge4(s1: String, contains s2: String) -> Bool {
    //MARK: Recap
    return s1.range(of: s2, options: .caseInsensitive) != nil
}

/*
 Write a function that accepts a string, and returns how many times a specific character appears,
 taking case into account.
 */
func challenge5(input: String, char: Character) -> Int {
    //return input.reduce(0) { $1 == char ? $0 + 1 : $0 }
    //return input.count - input.replacingOccurrences(of: String(char), with: "").count
    let countedSet = NSCountedSet(array: Array(input))
    return countedSet.count(for:char)
}

/*
 Write a function that accepts a string as its input, and returns the same string just with
 duplicate letters removed.
 */
//MARK: Recap
func challenge6(input: String) -> String {
    /*let array = input.map { String($0) }
     let orderedSet = NSOrderedSet(array: array)
     return (orderedSet.array as! [String]).joined()*/
    var set = Set<Character>()
    return input.filter { set.insert($0).inserted }
}

/*
 Write a function that returns a string with any consecutive spaces replaced with a single space.
 */
func challenge7(input: String) -> String {
    //MARK: Recap
    //return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
    var seenSpace = false
    var result = ""
    for char in input {
        if char == " " {
            if seenSpace { continue }
            seenSpace = true
        } else {
            seenSpace = false
        }
        result.append(char)
    }
    return result
}

/*
 Write a function that accepts two strings, and returns true if one string is rotation of the other,
 taking letter case into account.
 */
func challenge8(s1: String, isReverseOf s2: String) -> Bool {
    //MARK: Recap
    guard s1.count == s2.count else { return false }
    return (s2 + s2).contains(s1)
}

/*
 Write a function that returns true if it is given a string that is an English pangram, ignoring
 letter case.
 Tip: A pangram is a string that contains every letter of the alphabet at least once.
 */
func challenge9(input: String) -> Bool {
    //MARK: Recap
    let set = Set(input.lowercased())
    let alphabets = set.filter { $0 >= "a" && $0 <= "z" }
    return alphabets.count == 26
}

/*
 Given a string in English, return a tuple containing the number of vowels and consonants.
 Tip: Vowels are the letters, A, E, I, O, and U; consonants are the letters B, C, D, F, G, H, J, K, L, M, N, P, Q, R, S, T, V, W, X, Y, Z.
 */
func challenge10(input: String) -> (vowels: Int, consonants:
    Int) {
        let vowelsSet = Set("AEIOUE")
        let consonantsSet = Set("BCDFGHJKLMNPQRSTVWXYZ")
        var vowelCounts = 0, consonantCount = 0
        for char in input.uppercased() {
            if vowelsSet.contains(char) {
                vowelCounts += 1
            } else if consonantsSet.contains(char) {
                consonantCount += 1
            }
        }
        return (vowelCounts, consonantCount)
}

/*
 Write a function that accepts two strings, and returns true if they are identical in length but
 have no more than three different letters, taking case and string order into account.
 */
func challenge11(first: String, second: String) -> Bool {
    guard first.count == second.count else { return false }
    let firstArray = Array(first)
    let secondArray = Array(second)
    var differences = 0
    for (index, letter) in firstArray.enumerated() {
        if secondArray[index] != letter {
            differences += 1
            if differences == 4 {
                return false
            }
        }
    }
    return true
}

/*
 Write a function that accepts a string of words with a similar prefix, separated by spaces, and
 returns the longest substring that prefixes all words.
 */
func challenge12(input: String) -> String {
    let wordsArray = input.components(separatedBy: .whitespaces)
    //return wordsArray.isEmpty ? "" : wordsArray.reduce(wordsArray[0]) { $1.commonPrefix(with: $0) }
    guard let first = wordsArray.first else { return "" }
    var bestPrefix = ""
    var currentPrefix = ""
    for letter in first {
        currentPrefix.append(letter)
        for word in wordsArray {
            if !word.hasPrefix(currentPrefix) {
                return bestPrefix
            }
        }
        bestPrefix  = currentPrefix
    }
    return bestPrefix
}

/*
 Write a function that accepts a string as input, then returns how often each letter is repeated in
 a single run, taking case into account. The string “aabbcc” should return “a2b2c2”.
 */
func challenge13(input: String) -> String {
    var result = ""
    guard var currentLetter = input.first else { return input }
    var letterCount = 0
    for letter in input {
        if currentLetter == letter {
            letterCount += 1
        } else {
            result.append("\(currentLetter)\(letterCount)")
            currentLetter = letter
            letterCount = 1
        }
    }
    result.append("\(currentLetter)\(letterCount)")
    return result
}

/*
 Write a function that prints all possible permutations of a given input string.
 */
func challenge14(items: String) -> [String] {
    var scratch = Array(items)
    var result = [String]()
    
    // Heap's algorithm
    func heap(_ n: Int) {
        if n == 1 {
            result.append(String(scratch))
            return
        }
        
        for i in 0..<n-1 {
            heap(n-1)
            //let j = (n%2 == 1) ? 0 : i
            scratch.swapAt(i, n-1)
        }
        heap(n-1)
    }
    
    // Let's get started
    heap(scratch.count)
    return result
}

/*
 Write a function that returns a string with each of its words reversed but in the original order,
 without using a loop.
 */
func challenge15(items: String) -> String {
    return items.components(separatedBy: .whitespaces)
        .map { String($0.reversed()) }
        .joined(separator: " ")
}
