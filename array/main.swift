//
//  main.swift
//  array
//
//  Created by hello on 2020/8/11.
//  Copyright © 2020 TK. All rights reserved.
//

import Foundation

func test() {
    let numbers = [2, 3, 5, 7]
    var numbersIterator = numbers.makeIterator()
    while let num = numbersIterator.next() {
        print(num)
    }
}



test()

