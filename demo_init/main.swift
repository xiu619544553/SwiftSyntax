//
//  main.swift
//  demo_init
//
//  Created by hello on 2020/8/13.
//  Copyright © 2020 TK. All rights reserved.
//  初始化 https://www.cnswift.org/initialization

/*
 初始化是为类、结构体或者枚举准备实例的过程。
 这个过需要给实例里的每一个存储属性设置一个初始值并且在新实例可以使用之前执行任何其他所必须的配置或初始化。

 你通过定义初始化器来实现这个初始化过程，它更像是一个用来创建特定类型新实例的特殊的方法。
 不同于 Objective-C 的初始化器，Swift 初始化器不返回值。
 这些初始化器主要的角色就是确保在第一次使用之前某类型的新实例能够正确初始化。
 
 类类型的实例同样可以实现一个反初始化器，它会在这个类的实例被释放之前执行任意的自定义清理。更多关于反初始化器的信息，请看反初始化  https://www.cnswift.org/deinitialization。
 */

import Foundation

// MARK: 为存储属性设置初始化值
#warning("在创建类和结构体的实例时必须为所有的存储属性设置一个合适的初始值。存储属性不能遗留在不确定的状态中。")
#warning("当你给一个存储属性分配默认值，或者在一个初始化器里设置它的初始值的时候，属性的值就会被直接设置，不会调用任何属性监听器。")

/*
 你可以在初始化器里为存储属性设置一个初始值，或者通过分配一个默认的属性值作为属性定义的一部分。在下面的小节中会描述这些动作。
 */


// MARK: 初始化器

struct Number1 {
    // 存储属性：在声明时或初始化器中初始化
    var number: Double
    init() {
        // 如果存储属性在声明时没有初始化，则必须在初始化器中初始化
        number = 10.0
    }
}

// MARK: 默认的属性值  -- 在声明存储属性时，就给定其初始化值
/*
 如果一个属性一直保持相同的初始值，可以提供一个默认值而不是在初始化器里设置这个值。最终结果是一样的，但是默认值将属性的初始化与声明更紧密地联系到一起。它使得你的初始化器更短更清晰，并且可以让你属性根据默认值推断类型。如后边的章节所述，默认值也让你使用默认初始化器和初始化器继承更加容易。
 */

// MARK: 自定义初始化 - 初始化形式参数

struct Number2 {
    var temp: Int
    // mean 外部变量名
    // number 局变量名
    init(mean number: Int) {
        temp = number/2
    }
}

// MARK: 形式参数名和实际参数标签


func test() {
    print("...")
}
