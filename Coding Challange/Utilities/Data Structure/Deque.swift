//
//  Deque.swift
//  Coding Challange
//
//  Created by Faisal Iqbal on 12/4/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation
struct Deque<T> {
    private var array: [T] = []
    
    mutating func pushBack(_ item: T) {
        array.append(item)
    }
    
    mutating func pushFront(_ item: T) {
        array.insert(item, at: 0)
    }
    
    mutating func popFront() -> T? {
        guard !array.isEmpty else { return nil }
        return array.removeFirst()
    }
    
    mutating func popBack() -> T? {
        return array.popLast()
    }
    
    var count: Int {
        return array.count
    }
}
