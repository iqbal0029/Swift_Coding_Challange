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
