//
//  main.swift
//  demo_func
//
//  Created by hello on 2020/8/13.
//  Copyright © 2020 TK. All rights reserved.
//  函数 https://www.cnswift.org/functions

import Foundation

// MARK: 有参数 有返回值
// age: 形式参数，返回值 Int
func test1(age: Int) -> Int {
    return age
}

// MARK: 无参数无返回值
 
func test2() {

    /*
     注意
     严格来讲，函数 greet(person:)还是有一个返回值的，尽管没有定义返回值。没有定义返回类型的函数实际上会返回一个特殊的类型 Void。它其实是一个空的元组，作用相当于没有元素的元组，可以写作 () 。
     */
}

// MARK: 多返回值函数
func minMax(array: [Int]) -> (min: Int, max: Int) {
    
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
    
}


func testMethod() {
    
    let (min, max) = minMax(array: [2, 4, 1, 7, 6, 8, 3, 10])
    
    print("min = \(min)")
    print("max = \(max)")
    
    
    
    
    
}




testMethod()
