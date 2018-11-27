//
//  Numbers.swift
//  Coding Challange
//
//  Created by Faisal Ikwal on 27/11/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation
/*
 Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases.
 */
func challenge16() {
    (1...100).forEach { count in
        count % 3 == 0 ? (count % 5 == 0 ? print("Fizz Buzz") : print("Fizz"))
                       : (count % 5 == 0 ? print("Buzz") : print(count))
    }
    /*for count in 1...100 {
        let fizzBuzz = (count % 3 == 0, count % 5 == 0)
        switch fizzBuzz {
        case (true, true):
            print("Fizz Buzz")
        case (true, false):
            print("Fizz")
        case (false, true):
            print("Buzz")
        case (false, false):
            print(count)
        }
    }*/
}

/*
 Write a function that accepts positive minimum and maximum integers, and returns a random
 number between those two bounds, inclusive.
 Given minimum 8 and maximum 10, the return values 8, 9, 10 are valid.
 */
func challenge17(min: Int, max: Int) -> Int {
    /*
     arc4random_uniform() generates numbers from 0 up to an upper bound, it excludes the upper bound rather than including it, and it uses UInt32 rather than Int.
     */
    return Int.random(in: min...max) //swift 4.2
    //return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}

/*
 Create a function that accepts positive two integers, and raises the first to the power of the
 second.
 */
func challenge18(number: Int, power: Int) -> Int {
    guard number > 0 else { return 0 }
    var result = 1
    for _ in 0..<power {
        result *= number
    }
    return result
}

/*
 Swap two positive variable integers, a and b, without using a temporary variable.
 */
func challenge19(n1: inout Int, n2: inout Int) {
    /*n1 = n1 + n2
    n2 = n1 - n2
    n1 = n1 - n2*/
    
    /*n1 = n1 ^ n2
    n2 = n1 ^ n2
    n1 = n1 ^ n2*/
    
    swap(&n1, &n2)
    
    //(n1, n2) = (n2, n1)
}

/*
Write a function that accepts an integer as its parameter and returns true if the number is prime.
 */
/*
 if the number n is not prime, it means it can be reached by multiplying two factors, x and y. If both of those numbers were greater than the square root of n, then x * y would be greater than n, which is not possible. So, we can be sure that at least one of x or y is less than or equal to the square root of n.
 */
func challenge20(number: Int) -> Bool {
    guard number > 1 else { return false }
    guard number != 2 else { return true }
    for n in 2...Int(ceil(sqrt(Double(number)))) {
        if number % n == 0 {
            return false
        }
    }
    return true
}

/*
 Create a function that accepts any positive integer and returns the next highest and next lowest number that has the same number of ones in its binary representation. If either number is not possible, return nil for it.
The number 12 is 1100 in binary, so it has two 1s. The next highest number with that many 1s is 17, which is 10001. The next lowest is 10, which is 1010.
 */
func challenge21(number: Int) -> (nextHighest: Int?, nextLowest: Int?) {
    var nextHigh: Int? = nil
    var nextLow: Int? = nil
    let onesCount = number.onesCount
    for n in number+1...Int.max {
        if n.onesCount == onesCount {
            nextHigh = n
            break
        }
    }
    for n in (0..<number).reversed() {
        if n.onesCount == onesCount {
            nextLow = n
            break
        }
    }
    return (nextHigh, nextLow)
}

/*
 Create a function that accepts an unsigned 8-bit integer and returns its binary reverse, padded
 so that it holds precisely eight binary digits.
 Tip: When you get the binary representation of a number, Swift will always use as few bits as possible – make sure you pad to eight binary digits before reversing.
 */
func challenge22(number: UInt) -> UInt {
    let binary = String(number, radix: 2)
    let paddedBinary = String(repeating: "0", count: 8 - binary.count) + binary
    return UInt(String(paddedBinary.reversed()), radix: 2)!
}

/*
 Write a function that accepts a string and returns true if it contains only numbers, i.e. the digits
 0 through 9.
 */
//If the string is all numbers, then searching for everything except numbers (hence the inverted) will return nil.
func challenge23(input: String) -> Bool {

    //MARK: Recap
    //return input.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    return input.rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789").inverted) == nil
    /*for char in input {
        if Int(String(char)) == nil {
            return false
        }
    }
    return true*/
}

/*
 Given a string that contains both letters and numbers, write a function that pulls out all the
 numbers then returns their sum.
 Sample input and output
 • The string “a1b2c3” should return 6 (1 + 2 + 3).
 • The string “a10b20c30” should return 60 (10 + 20 + 30).
 • The string “h8ers” should return “8”.
 */
func challenge24(input: String) -> Int {
    /*var sum = 0
    var currentNumber = 0
    for char in input {
        if let number = Int(String(char)) {
            currentNumber = currentNumber*10 + number
        } else {
            sum += currentNumber
            currentNumber = 0
        }
    }
    sum += currentNumber
    return sum*/
    
    let regex = try! NSRegularExpression(pattern: "(\\d+)", options: [])
    let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
    let allNumbers = matches.compactMap { Int((input as
        NSString).substring(with: $0.range)) }
    return allNumbers.reduce(0, +)
}

/*
 Write a function that returns the square root of a positive integer, rounded down to the nearest
 integer, without using sqrt().
 Sample input and output
 • The number 9 should return 3.
 • The number 16777216 should return 4096.
 • The number 16 should return 4.
 • The number 15 should return 3.
 */
func challenge25(input: Int) -> Int {
    //return Int(floor(pow(Double(input), 0.5)))
    /*for n in 0...input/2 {
        if n*n > input {
            return n-1
        }
    }
    return 0*/
    //MARK: Recap
    guard input != 1 else { return 1 }
    var lowerBound = 0
    var upperBound = 1 + input/2
    var mid = 0
    //Div of two consecutive int number always give first one 5+6=5
    while lowerBound + 1 < upperBound {
        mid = (lowerBound + upperBound)/2
        if mid * mid > input {
            upperBound = mid
        } else if mid * mid < input {
            lowerBound = mid
        } else {
            return mid
        }
    }
    return mid
}

/*
 Create a function that subtracts one positive integer from another, without using -.
 • 00000000 is still 0
 • 10000000 is -128
 • 10000001 is -127
 • 10000010 is -126
 • 10000011 is -125
 • 10000100 is -124
 • 10000101 is -123
 • 11000000 is -64
 • 11111111 is -1
 ~number = -(number + 1) ex: ~64 = -65
 */
//MARK: Recap
func challenge26(subtract: Int, from: Int) -> Int {
    return from + (~subtract + 1)
    //return from + -subtract
    //return from + -1 * subtract
}
