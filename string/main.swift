//
//  main.swift
//  string
//
//  Created by hello on 2020/8/7.
//  Copyright © 2020 TK. All rights reserved.
//

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
}

