//
//  Collections.swift
//  Coding Challange
//
//  Created by Faisal Ikwal on 30/11/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation

/*
 Write an extension for collections of integers that returns the number of times a specific digit
 appears in any of its numbers.
 Sample input and output
 • The code [5, 15, 55, 515], count: "5"  should return 6.
 • The code [5, 15, 55, 515], count: "1"  should return 2.
 • The code [55555], count: "5"  should return 5.
 • The code [55555], count: "1"  should return 0.
 */
func challenge37(array: [Int], count: Character) -> Int {
    return array.count(of: count)
}

/*
 Write an extension for all collections that returns the N smallest elements as an array, sorted
 smallest first, where N is an integer parameter.
 Sample input and output
 • The code [1, 2, 3, 4], count: 3 should return [1, 2, 3].
 • The code ["q", "f", "k"], count: 10 should return [“f”,
 “k”, “q”].
 • The code [256, 16], count: 3 should return [16, 256].
 • The code [String](), count: 3 should return an empty
 array.
 */
func challenge38<T: Comparable>(array: [T], count: Int) -> [T] {
    return array.sorted(count: count)
}

/*
 Extend collections with a function that returns an array of strings sorted by their lengths,
 longest first.
 Sample input and output
 • The code ["a", "abc", "ab"] should return ["abc", "ab", "a"].
 • The code ["paul", "taylor", "adele"] should return ["taylor", "adele", "paul"].
 • The code [String]() should return [].
 */
func challenge39(array: [String]) -> [String] {
    return array.sortedByElementLength
}

/*
 Create a function that accepts an array of unsorted numbers from 1 to 100 where zero or more
 numbers might be missing, and returns an array of the missing numbers.
 Sample input and output
 If your test array were created like this:
 Then your method should [7, 21, 26], because those are the numbers missing from the array.
 */
func challenge40(array: [Int]) -> [Int] {
    let fullSet = Set(1...100)
    let uncompleteSet = Set(array)
    return Array(fullSet.subtracting(uncompleteSet))
    //return Array(fullSet.symmetricDifference(uncompleteSet)) //not in both
}

/*
 Write an extension to collections that accepts an array of Int and returns the median average,
 or nil if there are no values.
 Tip: The mean average is the sum of some numbers divided by how many there are. The median average is the middle of a sorted list. If there is no single middle value – e.g. if there are eight numbers - then the median is the mean of the two middle values.
 Sample input and output
 • The code [1, 2, 3] should return 2.
 • The code [1, 2, 9] should return 2.
 • The code [1, 3, 5, 7, 9] should return 5.
 • The code [1, 2, 3, 4] should return 2.5.
 • The code [Int]() should return nil.
 */
func challenge41(array: [Int]) -> Double? {
    return array.median
}

/*
 Write an extension for all collections that reimplements the index(of:) method.
 */
func challenge42<T: Equatable>(array: [T], item: T) -> Int? {
    return array.indexOf(item)
}

/*
 Create a linked list of lowercase English alphabet letters, along with a method that traverses all
 nodes and prints their letters on a single line separated by spaces.

 */
func challenge43() {
    let list = LinkedList.from(items: "abcdefghijklmnopqrstuvwxyz")
    list.printNodes()
}

/*
 Center of linkedlist
 */
func challenge44() {
    let list = LinkedList.from(items: [1, 3, 5, 7, 9])
    print(list.center?.value ?? "")
}

/*
 Write a new method for your binary search tree that traverses the tree in order, running a closure on each node.
 */
func challenge45() {
}

/*
 recreate map
 */
func challenge46() {
    let result = [1, 2, 3].myMap { String($0) }
    print(result)
}

/*
 recreate min
 */
func challenge47() {
    let result = [-1, 1, 2, 3].myMin()
    print(result!)
}

/*
Create a new data type that models a double-ended queue using generics, or deque. You should be able to push items to the front or back, pop them from the front or back, and get the number of items.
 */
func challenge48() {
    var numbers = Deque<Int>()
    numbers.pushBack(5)
    numbers.pushBack(8)
    numbers.pushBack(3)
    assert(numbers.count == 3)
    assert(numbers.popFront()! == 5)
    assert(numbers.popBack()! == 3)
    assert(numbers.popFront()! == 8)
    assert(numbers.popBack() == nil)
}

/*
 Write a function that accepts a variadic array of integers and return the sum of all numbers that appear an even number of times.
 */
func challenge49(numbers: Int...) -> Int {
    let countedSet = NSCountedSet(array: numbers)
    var sum = 0
    for case let item as Int in countedSet {
        guard countedSet.count(for: item) % 2 == 0 else {
            continue
        }
        sum += item
    }
    return sum
}

/*
 
 Write a function that accepts an array of positive and negative numbers and returns a closed range containing the position of the contiguous positive numbers that sum to the highest value, or nil if nothing were found.
 */
//TODO: Recap
//Range 0.1..<0.4 - ClosedRange 0.1...0.4 include upper bound
//CountableRange 0..<4 - CoutableClosedRange 0...4 known Step value ie 1
func challenge50(_ input: [Int]) -> CountableClosedRange<Int>? {
    guard !input.isEmpty else { return nil }
    var range: CountableClosedRange<Int>?
    
    var startIndex: Int? = 0
    var currentSum = 0
    var bestSum = 0
    
    for (index, element) in input.enumerated() {
        if element > 0 {
            currentSum += element
            startIndex = startIndex ?? index
            if currentSum > bestSum {
                bestSum = currentSum
                range = startIndex!...index
            }
        } else {
            currentSum = 0
            startIndex = nil
        }
    }
    return range
}

/*
 Expand your code from challenge 43 so that it has a reversed() method that returns a copy
 of itself in reverse.
 */
func challenge51() {
    let list = LinkedList.from(items: [1, 2, 3, 4])
    let reversedList = list.reversed()
    reversedList.printNodes()
}
