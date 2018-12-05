//
//  LinkedList.swift
//  Coding Challange
//
//  Created by Faisal Ikwal on 03/12/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation
class LinkedListNode<T> {
    var value: T
    var nextNode: LinkedListNode?
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var start: LinkedListNode<T>?

    var center: LinkedListNode<T>? {
        var slow = start
        var fast = start
        while fast != nil, fast?.nextNode != nil {
            slow = slow?.nextNode
            fast = fast?.nextNode?.nextNode
        }
        return slow
    }

    func reversed() -> LinkedList {
        return self
    }
    

}

extension LinkedList {
    static func from<A: Collection>(items: A) -> LinkedList<T> where A.Element == T {
        let list = LinkedList<T>()
        var lastNode: LinkedListNode<T>? = nil
        for element in items {
            let node = LinkedListNode(value: element)
            if let last = lastNode {
                last.nextNode = node
            } else {
                list.start = node
            }
            lastNode = node
        }
        return list
    }

    func printNodes() {
        var currentNode = start
        while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.nextNode
        }
    }

}
