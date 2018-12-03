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
    let list = LinkedList<Character>()
    var lastNode: LinkedListNode<Character>? = nil
    for char in "abcdefghijklmnopqrstuvwxyz" {
        let node = LinkedListNode(value: char)
        if let last = lastNode {
            last.nextNode = node
        } else {
            list.start = node
        }
        lastNode = node
    }
    list.printNodes()
}

/*
 Center of linkedlist
 */
func challenge44() {
    let list = LinkedList<Int>()
    var lastNode: LinkedListNode<Int>? = nil
    for element in [1, 3, 5, 7, 9] {
        let node = LinkedListNode(value: element)
        if let last = lastNode {
            last.nextNode = node
        } else {
            list.start = node
        }
        lastNode = node
    }
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
    print(result)
}
