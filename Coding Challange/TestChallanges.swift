//
//  File.swift
//  Coding Challange
//
//  Created by Faisal Ikwal on 13/12/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation
class TestChallanges {
    //MARK: Chapter 5 Algorithms
    class func algorithmsChallenge() {
        //challenge55()
        //challenge56()
        //print(challenge57(first: 3.14159, second: 2.03048))
        //print(challenge58(input: "([])(<{}>)"))
        challenge59()
    }

    //MARK: Chapter 4 Collections
    class func collectionsChallenge() {
        //print(challenge37(array: [5, 15, 55, 515], count: "1"))
        //print(challenge38(array: [5, 155, 55, 515], count: 35))
        //print(challenge39(array: ["a", "abc", "ab"]))
        /*var testArray = Array(1...100)
         testArray.remove(at: 25)
         testArray.remove(at: 20)
         testArray.remove(at: 6)
         print(challenge40(array: testArray))*/
        //print(challenge41(array: [1, 3, 5, 7, 9]))
        //print(challenge42(array: [1, 3, 5, 7, 9], item: 10))
        //challenge43()
        //challenge44()
        //challenge45()//TODO
        //challenge46()
        //challenge47()
        //challenge48()
        //print(challenge49(numbers: 1, 2, 2, 3, 3))
        //print(challenge50([10, 20, 30, -10, -20, 10, 20]))
        //challenge51()
        //print(challenge52(Array<Float>([1.0, 2.0, 3.0])))
        //challenge53()
        challenge54()

    }

    //MARK: Chapter 3 Files
    class func filesCodingChallenge() {
        //challenge28(log: "Secret Message", to: "CodingChallange.log")
        //print(challenge30(in: "/Users/faisal.ikwal/Desktop/Screen_shot"))
        // print(challenge31(source: "/Users/faisal.ikwal/Desktop/Screen_shot/SSH.pngg", destination: "/Users/faisal.ikwal/Documents/SSH.png"))
        //print(challenge33(in: "/Users/faisal/Desktop/ScreenShot"))
        //print(challenge34(in: "/Users/faisal/Desktop/ScreenShot"))
        //challenge35(in: "/Users/faisal.ikwal/Desktop/Image")
        if let fileURL = Bundle.urlFor(filename: "Sample.txt") {
            challenge27(filePath: fileURL.path, lineCount: 5)
            print(challenge32(filePath: fileURL.path, count: "Julius"))
            print(challenge36(filePath: fileURL.path))
        }

    }

    //MARK: Chapter 2 Numbers
    class func numbersCodingChallenge() {
        //challenge16()
        //print(challenge17(min: 10, max:15))
        //print(challenge18(number: 2, power: 4))
        /*var a = 10, b = 20
         challenge19(n1: &a, n2: &b)
         print(a, b)*/
        //print(challenge20(number: 2))
        //print(challenge21(number: 12))
        //print(challenge22(number: 32))
        //print(challenge23(input: "32a"))
        //print(challenge24(input: "h8ers"))
        //print(challenge25(input: 16777216))
        print(challenge26(subtract: 20, from: 37))
    }

    //MARK: Chapter 1 Strings
    class func stringsCodingChallenge() {
        /*assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
         assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true,
         "Challenge 1 failed")
         assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
         assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")*/

        //assert(challenge2(input: "Rats live on no evil star") == true, "Challenge 2 failed")

        //assert(challenge3(s1: "abc", s2: "bca") == true, "Challenge 3 failed")

        //assert(challenge4(s1: "Hello, world", contains: "WORLD") == true, "Challenge 4 failed")

        //print(challenge5(input: "The rain in Spain", char: "a"))

        //print(challenge6(input: "aabbccdd"))
        //print(challenge7(input: "a   b      c    d      d     efgh"))
        //print(challenge8(s1: "eabcd", isReverseOf: "abcde"))
        //print(challenge10(input: "Swift Coding Challenges"))
        //print(challenge12(input: "swift switch swill swim"))
        //print(challenge13(input: "aaAAaa"))
        //print(challenge14(items: "ABCD"))
        print(challenge15(items: "Swift Coding Challenges"))
    }
}
