//
//  main.swift
//  demo_collection
//
//  Created by hello on 2020/8/24.
//  Copyright © 2020 TK. All rights reserved.
//  集合类型  https://www.cnswift.org/collection-types#spl-22
//  Swift 的 Array类型被桥接到了基础框架的 NSArray类上。Cocoa 和 Objective-C 一起使用 https://developer.apple.com/documentation/swift#2984801
//  Swift提供的集合类型：数组、字典、合集

import Foundation


/*
 let 集合：不可变集合，它的内容和大小都不可变
 var 集合：可变集合，可以CRUD
 
 在集合不需要改变的情况下创建不可变集合是个不错的选择。这样做可以允许 Swift 编译器优化你创建的集合的性能。


 */


func testArray() {
    print("...数组...")
    
    // Swift 数组 Array是结构体 struct
    
    // Swift 数组的类型完整写法是 Array<Element>
    // 不可变数组
    let someInts = Array<Int>.init()
    print(someInts)
    
    // 推荐写法
    // 可变数组
    var numbers = [Int]()
    numbers.append(10)
    numbers.append(2)
    print("numbers.count = \(numbers.count)")
    
    var strings = [String]()
    strings.append("name")
    strings.append("age")
    print("emptyArray = \(strings)")
    
    
    // MARK: 使用默认值创建数组
    // Swift 的 Array类型提供了初始化器来创建确定大小且元素都设定为相同默认值的数组。你可以传给初始化器对应类型的默认值（叫做 repeating）和新数组元素的数量（叫做 count）：
    var threeDoubles = Array(repeating: 0.0, count: 10)
    print("threeDoubles.count = \(threeDoubles.count)")
    print("threeDoubles = \(threeDoubles)")
    threeDoubles.append(1.1)
    print("threeDoubles.count = \(threeDoubles.count)")
    print("threeDoubles = \(threeDoubles)")

    threeDoubles[0] = 0.9
    print("threeDoubles.count = \(threeDoubles.count)")
    print("threeDoubles = \(threeDoubles)")
    
    
    print("...数组...\n")
}



testArray()


