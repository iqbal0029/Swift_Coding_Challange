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

    var isLeaf: Bool {
        return left != nil && right != nil
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

    private func height(node: Node<T>?) -> Int {
        guard node != nil else { return 0 }
        return max(height(node: node?.left), height(node: node?.right)) + 1
    }

    func height() -> Int {
        return height(node: root)
    }
    /*
     Consider a height-balancing scheme where following conditions should be checked to determine if a binary tree is balanced.
     An empty tree is height-balanced. A non-empty binary tree T is balanced if:
     1) Left subtree of T is balanced
     2) Right subtree of T is balanced
     3) The difference between heights of left subtree and right subtree is not more than 1.
     */
    private func isBalanced(node: Node<T>?) -> Bool {
        guard let node = node else { return true }

        let leftHeight = height(node: node.left)
        let rightHeight = height(node: node.right)

        return
            abs(leftHeight - rightHeight) <= 1
            && isBalanced(node: node.left)
            && isBalanced(node: node.right)

    }

    func isBalanced() -> Bool {
        return isBalanced(node: root)
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
