//
//  Extensions.swift
//  Coding Challange
//
//  Created by Faisal Ikwal on 20/11/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation
extension String {
    func character(at position: Int) -> Character? {
        //MARK: Recap
        guard
            position >= 0,
            let indexPostition = index(startIndex, offsetBy: position, limitedBy: endIndex)
            else { return nil }
        return self[indexPostition]
    }
}

extension Bundle {
    static func urlFor(filename: String) -> URL? {
        let pathArray = filename.components(separatedBy: ".")
        return Bundle.main.url(forResource: pathArray[safe: 0] ?? "", withExtension: pathArray[safe: 1] ?? "")
    }
}

extension FileManager {
    static var documentDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

extension BinaryInteger {
    var onesCount: Int {
        return String(self, radix: 2).reduce(0) { $1 == "1" ? $0 + 1 : $0 }
    }
}

extension MutableCollection where Index == Int {
    subscript(safe index: Index) -> Element? {
        guard self.count > index else { return nil }
        return self[index]
    }
}

extension Collection where Element == Int, Index == Int {
    func count(of char: Character) -> Int {
        /*return reduce(0) {
            $0 + String($1).filter { $0 == char }.count
        }*/
        //return NSCountedSet(array: Array(map(String.init).joined())).count(for: char)
        var count = 0
        forEach {
            for c in String($0) {
                guard c == char else { continue }
                count += 1
            }
        }
        return count
    }

    var median: Double? {
        guard count != 0 else { return nil }
        let middle = count / 2
        if count % 2 == 0 {
            return Double((self[middle - 1] + self[middle]) / 2)
        } else {
            return Double(self[middle])
        }
    }
}

extension Collection where Element == String {
    var sortedByElementLength: [String] {
        return sorted { $0.count > $1.count }
    }
}

extension Collection where Element: Comparable {
    func sorted(count: Int) -> [Element] {
        return Array(self.sorted().prefix(count))
    }

    func myMin() -> Element? {
        guard self.count > 0 else { return nil }
        return reduce(first!) { $0 < $1 ? $0 : $1 }
    }
}

extension Collection where Element: Equatable {
    func indexOf(_ searchitem: Element) -> Int? {
        for (index, item) in self.enumerated() {
            if item == searchitem {
                return index
            }
        }
        return nil
    }
}

extension Collection {
    func myMap<T>(_ transform: (Element) throws -> T) rethrows -> [T]  {
        var result = [T]()
        for item in self {
            result.append(try transform(item))
        }
        return result
    }
}
