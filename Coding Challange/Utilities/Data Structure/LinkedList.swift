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

    init(_ head: LinkedListNode<T>?) {
        self.start = head
    }
    
    convenience init<A: Collection>(_ items: A) where A.Element == T {
        self.init(nil)
        var lastNode: LinkedListNode<T>? = nil
        for element in items {
            let node = LinkedListNode(value: element)
            if let last = lastNode {
                last.nextNode = node
            } else {
                self.start = node
            }
            lastNode = node
        }
    }
    
    subscript(_ index: Int) -> LinkedListNode<T>? {
        var index = index
        var node = self.start
        while index != 0 && node != nil  {
            node = node?.nextNode
            index -= 1
        }
        return node
    }
    
    var center: LinkedListNode<T>? {
        var slow = start
        var fast = start
        while fast != nil, fast?.nextNode != nil {
            slow = slow?.nextNode
            fast = fast?.nextNode?.nextNode
        }
        return slow
    }

    func reverse() {
        guard var curr = self.start else { return }
        var prev: LinkedListNode<T>? = nil
        while let next = curr.nextNode {
            curr.nextNode = prev
            prev = curr
            curr = next
        }
        curr.nextNode = prev
        start = curr
    }
    
    func reversed() -> LinkedList<T> {
        let copied = self.copy()
        copied.reverse()
        return copied
    }
    
    func copy() -> LinkedList<T> {
        guard var orig = self.start else { return LinkedList(nil) }
        let copiedNode = LinkedListNode(value: orig.value)
        var currCopiedNode = copiedNode
        while let next = orig.nextNode {
            currCopiedNode.nextNode = LinkedListNode(value: next.value)
            orig = next
            currCopiedNode = currCopiedNode.nextNode!
        }
        return LinkedList(copiedNode)
    }
    
    var containLoop: Bool {
        var slow = self.start
        var fast = self.start
        while slow != nil && fast != nil {
            slow = slow?.nextNode
            fast = fast?.nextNode?.nextNode
            if fast?.nextNode === slow {
                return true
            }
        }
        return false
    }

}

extension LinkedList {
    func printNodes() {
        var currentNode = start
        while let node = currentNode {
            print(node.value, terminator: "->")
            currentNode = node.nextNode
        }
        print("nil")
    }

}
