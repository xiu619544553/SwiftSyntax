//
//  main.swift
//  demo_Method
//
//  Created by hello on 2020/8/14.
//  Copyright © 2020 TK. All rights reserved.
//  方法 https://www.cnswift.org/methods

import Foundation

/*
 Swift 与 OC中方法区别：
 
 在 结构体和枚举中定义方法是 Swift 语言与 C 语言和 Objective-C 的主要区别。在 Objective-C 中，类是唯一能定义方法的类型。但是在 Swift ，你可以选择无论类，结构体还是方法，它们都拥有强大的灵活性来在你创建的类型中定义方法。
 */


// MARK: 实例方法 - 点语法调用

// MARK: self 属性

class Counter {
    var count = 0
    func increment() {
        
        /*
         每一个类的实例都隐含一个叫做 self的属性，它完完全全与实例本身相等。你可以使用 self属性来在当前实例当中调用它自身的方法。
         */
        self.count += 1
        
        /*
         实际上，你不需要经常在代码中写 self。如果你没有显式地写出 self，Swift会在你于方法中使用已知属性或者方法的时候假定你是调用了当前实例中的属性或者方法。
         */
        count += 1
    }
    
    
    func decrement(count: Int) -> Bool {
        /*
         对于这个规则的一个重要例外就是当一个实例方法的形式参数名与实例中某个属性拥有相同的名字的时候。在这种情况下，形式参数名具有优先权，并且调用属性的时候使用更加严谨的方式就很有必要了。你可以使用 self属性来区分形式参数名和属性名。
         这时， self就避免了叫做 x 的方法形式参数还是同样叫做 x 的实例属性这样的歧义。
         
         除去 self 前缀，Swift 将会假定两个 count 都是叫做 count 的方法形式参数。
         */
        return self.count > count
    }
}


// MARK: 在实例方法中修改值类型

struct Point {
    var x = 0.0, y = 0.0
    func moveBy(x deltaX: Double, y deltaY: Double) {
        
    }
}

// 用 struct 定义资料物件型别
struct Cat {
    var name = ""
}


