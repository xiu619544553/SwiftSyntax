//
//  main.swift
//  demo_Property
//
//  Created by hello on 2020/8/12.
//  Copyright © 2020 TK. All rights reserved.
//  属性 https://www.cnswift.org/properties

import Foundation



/*
 
 作用：属性可以将值与特定的类、结构体、枚举联系起来
 
 属性类型：
 1、存储属性：存储属性会存储常量或变量作为实例的一部分；存储属性只能由类和结构体定义
    * 变量存储属性
    * 常量存储属性  https://www.cnswift.org/initialization#spl-9
 2、计算属性：计算属性会计算（而不是存储）值；计算属性可以由类、结构体和枚举定义
 
 存储属性和计算属性通常和特定类型的实例相关联。总之，属性也可以与类型本身相关联。这种属性就是所谓的类型属性。
 
 属性观察器：可以定义属性观察器来检查属性中值的变化，这样就可以用自定义的行为来响应。属性观察器可以被添加到你自己定义的存储属性中，也可以添加到子类从他的父类那里所继承来的属性中。
 
 */

class LifeQuestion {
    let text: String
    var request: String?
    
    init(text: String) {
        // 在初始化的任意时刻，你都可以给常量属性赋值，只要它在初始化结束时设置了确定的值即可。一旦为常量属性被赋值，它就不能再被修改了
        // 对于类实例来说，常量属性在初始化中只能通过引用的类来修改。它不能被子类修改
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

struct FixedLengthRange {
    var firstValue: Int
    // 在初始化时刻可以赋值；当新的值域创建时 length已经被创建并且不能再修改，因为它是一个常量 let
    let length: Int
}

class Person {
    var age: Int
    let weight: Double
    
    init(weight: Double, age: Int) {
        self.age    = age
        self.weight = weight
    }
}

// MARK: 存储属性
func storePropertySummary() {
    print("========存储属性========")
    
    // 1.1 变量结构体实例的存储属性
    var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
    rangeOfThreeItems.firstValue = 6
    // rangeOfThreeItems.length = 5 报错：Cannot assign to property: 'length' is a 'let' constant
    print("rangeOfThreeItems.firstValue=\(rangeOfThreeItems.firstValue)")
    
    // 1.2 常量结构体实例的存储属性
    // 如果创建了结构体的实例并且把这个实例赋给常量，你不能修改这个实例的属性，即使是声明为变量的属性：
    #warning("这是由于结构体是值类型。当一个值类型的实例被标记为常量时，该实例的其他属性也均为常量。")
    let rangeOfFourItems = FixedLengthRange(firstValue: 1, length: 5)
    // rangeOfFourItems.firstValue = 2 报错：Cannot assign to property: 'rangeOfFourItems' is a 'let' constant。因为 rangeOfFourItems 是 let 修饰的，不可修改
    print(rangeOfFourItems.firstValue)
    
    
    
    // 2.1 常量类实例的存储属性
    #warning("对于类来说则不同，它是引用类型。如果你给一个常量赋值引用类型实例，你仍然可以修改那个实例的变量属性。")
    let person = Person(weight: 85.0, age: 25)
    person.age = 26
    // person.weight = 90.0 报错：类常量属性只能在初始化时赋值，新的值域创建后就不允许创建了
    print("person.age = \(person.age)")
    
    
    print("========存储属性========\n")
}

// MARK: 常量存储属性
func constantSummary() {
    print("========常量存储属性========")
    let lq = LifeQuestion(text: "Life is beautiful")
    lq.ask()
    print("========常量存储属性========\n")
}


// MARK: 延迟存储属性

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    // 延迟存储属性的初始值在其第一次使用时才进行计算。你可以通过在其声明前标注 lazy 修饰
    var data = [String]() // 数组初始化
}

func lazyPropertySummary() {
    print("========延迟存储属性========")
    
    /*
     延迟存储属性的初始值在其第一次使用时才进行计算。你可以通过在其声明前标注 lazy 修饰
     
     Swift 把这些概念都统一到了属性声明里。Swift 属性没有与之相对应的实例变量，并且属性的后备存储不能被直接访问。这避免了不同环境中对值的访问的混淆并且将属性的声明简化为一条单一的、限定的语句。所有关于属性的信息——包括它的名字，类型和内存管理特征——都作为类的定义放在了同一个地方。
     */
    
    let manager = DataManager()
    manager.data.append("some data")
    manager.data.append("some more data")
    print(manager.data)
    print("manager.importer.fileName=\(manager.importer.fileName)")
    
    
    print("========延迟存储属性========\n")
}

// MARK: 存储属性与实例变量
// Swift 属性没有与之相对应的实例变量，并且属性的后备存储不能被直接访问。这避免了不同环境中对值的访问的混淆并且将属性的声明简化为一条单一的、限定的语句。所有关于属性的信息——包括它的名字，类型和内存管理特征——都作为类的定义放在了同一个地方。



// MARK: 计算属性

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size   = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width / 2.0
            let centerY = origin.y + size.height / 2.0
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - size.width / 2.0
            origin.y = newCenter.y - size.height / 2.0
        }
    }
}

func calculateProperty() {

    var square = Rect(origin: Point(x: 10.0, y: 10.0), size: Size(width: 100.0, height: 100.0))
    
    let originalCenter = square.center
    square.center = Point(x: 15.0, y: 15.0)
    
    print("originalCenter=\(originalCenter)；current center=\(square.center)")
}


// MARK: 简写设置器 - setter - newValue
// 如果一个计算属性的设置器没有为将要被设置的值定义一个名字，那么他将被默认命名为 newValue

struct AlternativeRect {
    var origin = Point()
    var size   = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width/2.0
            let centerY = origin.y + size.height/2.0
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - size.width/2.0
            origin.y = newValue.y - size.height/2.0
        }
    }
}

// MARK: 缩写读取器声明 - getter
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            // 隐式返回，隐藏 return
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


// MARK: 只读计算属性
// 一个有读取器但是没有设置器的计算属性就是所谓的只读计算属性。只读计算属性返回一个值，也可以通过点语法访问，但是不能被修改为另一个值。
// 注意：你必须用 var 关键字定义计算属性——包括只读计算属性——为变量属性，因为它们的值不是固定的。 let 关键字只用于常量属性，用于明确那些值一旦作为实例初始化就不能更改。

// 你可以通过去掉 get 关键字和他的大扩号来简化只读计算属性的声明：

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
//    var volume: Double { // 隐式返回函数
//        width * height * depth
//    }
}

func readOnlyProperty() {
    print("========只读计算属性========")
    
    let fourByFiveTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
    // 错误：Cannot assign to property: 'volume' is a get-only property
    // fourByFiveTwo.volume = 20.0
    print("fourByFiveTwo=\(fourByFiveTwo)   volume=\(fourByFiveTwo.volume)")
    
    print("========只读计算属性========\n")
}


// MARK: 属性观察者
// 属性观察者会观察并对属性值的变化做出回应。每当一个属性的值被设置时，属性观察者都会被调用，即使这个值与该属性当前的值相同。
/*
 你可以在如下地方添加属性观察者：

 * 你定义的存储属性；
 * 你继承的存储属性；
 * 你继承的计算属性。
 
 对于继承的属性，你可以通过在子类里重写属性来添加属性观察者。对于你定义的计算属性，使用属性的设置其来观察和响应值变化，而不是创建观察者。属性重载将会在重写中详细描述。
 
 你可以选择将这些观察者或其中之一定义在属性上：
 * willSet 会在该值被存储之前被调用。
 * didSet 会在一个新值被存储后被调用。
 
 * 如果你实现了一个 willSet 观察者，新的属性值会以常量形式参数传递。你可以在你的 willSet 实现中为这个参数定义名字。如果你没有为它命名，那么它会使用默认的名字 newValue。
 
 * 如果你实现了一个 didSet观察者，一个包含旧属性值的常量形式参数将会被传递。你可以为它命名，也可以使用默认的形式参数名 oldValue 。如果你在属性自己的 didSet 观察者里给自己赋值，你赋值的新值就会取代刚刚设置的值。
 
 注意
 父类属性的 willSet 和 didSet 观察者会在子类初始化器中设置时被调用。它们不会在类的父类初始化器调用中设置其自身属性时被调用。
 
 
 注意
 如果你以输入输出形式参数传一个拥有观察者的属性给函数， willSet 和 didSet 观察者一定会被调用。这是由于输入输出形式参数的拷贝入拷贝出存储模型导致的：值一定会在函数结束后写回属性。更多关于输入输出形式参数行为的讨论，参见输入输出形式参数。
 */

class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("willSet.totalSteps =\(newValue)")
        }
        didSet {
            print("didSet.totalSteps=\(totalSteps)")
            print("didSet.oldValue=\(oldValue)")
        }
    }
}

func observerProperty() {
    print("========属性观察者========")
    
    let counter = StepCounter()
    counter.totalSteps = 100
    
    print("111")
    
    counter.totalSteps = 200
    print("========属性观察者========\n")
}

// MARK: 输入输出形式参数 https://www.cnswift.org/functions#spl-13
func swap(a: inout Int, b: inout Int) {

    print("swap.前.a=\(a), b=\(b)")
    
    let temp = a
    a = b
    b = temp
    
    print("swap.后.a=\(a), b=\(b)")
}

func test1() {
    var a = 10
    var b = 3
    swap(&a, &b) // 直接在它前边添加一个和符号 ( &) 来明确可以被函数修改
    
    print("=======test1======")
    print("test1.a=\(a), b=\(b)")
}


// MARK: 属性包装
//@propertyWrapper
//struct TwelveOrLess {
//    private var number = 0
//    var wrappedValue: Int {
//        get { return number }
//        set { number = min(newValue, 12) }
//    }
//}

// MARK: 设定包装属性的初始值
// MARK: 通过属性包装映射值


// MARK: 全局和局部变量
// MARK: 类型属性
// MARK: 类型属性语法



constantSummary()
storePropertySummary()
lazyPropertySummary()
calculateProperty()
readOnlyProperty()
observerProperty()
test1()
