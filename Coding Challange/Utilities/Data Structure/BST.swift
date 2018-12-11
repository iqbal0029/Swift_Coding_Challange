//
//  BST.swift
//  Coding Challange
//
//  Created by Faisal Iqbal on 12/9/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation

class Node<T> {
    var value: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(value: T) {
        self.value = value
    }
    
    func traverse(_ body: (Node<T>) -> Void) {
        left?.traverse(body)
        body(self)
        right?.traverse(body)
    }
}

class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    init(array: [T]) {
        for element in array {
            guard root != nil else {
                root = Node(value: element)
                continue
            }
            var parentNode: Node<T>! = nil
            var currentNode = root
            while let current = currentNode {
                parentNode = current
                if element <= current.value {
                    currentNode = current.left
                } else {
                    currentNode = current.right
                }
            }
            
            if element < parentNode.value {
                parentNode.left = Node(value: element)
            } else {
                parentNode.right = Node(value: element)
            }

        }
    }
    
    var isBalanced: Bool {
        return false
    }
    
    func inorderTraverse() -> String {
        var result = ""
        func traverse(root: Node<T>?) {
            guard let rootNode = root else { return }
            traverse(root: rootNode.left)
            result.append("\(rootNode.value) ")
            traverse(root: rootNode.right)
        }
        traverse(root: root)
        return result
    }
    
    func traverse(_ body: (Node<T>) -> Void) {
        root?.traverse(body)
    }
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        return inorderTraverse()
    }
}
