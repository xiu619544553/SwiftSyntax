//
//  main.swift
//  string
//
//  Created by hello on 2020/8/7.
//  Copyright © 2020 TK. All rights reserved.
/*
 字符串和字符  https://www.cnswift.org/strings-and-characters
 */

import Foundation

// MARK: String
func stringSummary() {
    for character in "Cat!🐱️" {
        print(character)
    }
    
    let catCharacter: [Character] = ["C", "a", "t", "!", "🐱️"]
    let catString = String.init(catCharacter)
    print(catString)
    
    // UnsafePointer
    
    let numbers = [2, 3, 5, 7]
    var numbersIterator = numbers.makeIterator()
    while let num = numbersIterator.next() {
        print(num)
    }
}

