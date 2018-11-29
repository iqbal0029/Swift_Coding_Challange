//
//  ViewController.swift
//  Coding Challange
//
//  Created by Faisal Ikwal on 19/11/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        filesCodingChallage()
    }
    
    //MARK: Chapter 3 Files
    func filesCodingChallage() {
        //challenge27(filename: "Sample1.rtf", lineCount: 0)
        //challenge28(log: "Secret Message", to: "CodingChallange.log")
        //print(challenge30(in: "/Users/faisal.ikwal/Desktop/Screen_shot"))
       // print(challenge31(source: "/Users/faisal.ikwal/Desktop/Screen_shot/SSH.pngg", destination: "/Users/faisal.ikwal/Documents/SSH.png"))
        print(challenge32(filename: "Sample1.rtf", count: "Julius"))
    }
    
    //MARK: Chapter 2 Numbers
    func numbersCodingChallage() {
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
    func stringsCodingChallage() {
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
