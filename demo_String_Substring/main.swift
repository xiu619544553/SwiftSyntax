//
//  main.swift
//  demo_String_Substring
//
//  Created by hello on 2020/8/12.
//  Copyright © 2020 TK. All rights reserved.
//  字符串和字符
//  https://www.cnswift.org/strings-and-characters

import Foundation

// MARK: String
func stringSummary() {
    print("================String================")
    
    // MARK: 字符串字面量
    let something = "some string literal value"
    print("'something' is \(something)")
    
    
    // MARK: 多行字符串字面量
    let quotation = """
    The White Rabbit put on his spectacles.  "Where shall I begin,
    please your Majesty?" he asked.
     
    "Begin at the beginning," the King said gravely, "and go on
    till you come to the end; then stop."
    """
    print(quotation)
    
    // 多行字符串字面量把所有行包括在引号内。字符串包含第一行开始于引号标记（ """ ）并结束于末尾引号标记之前，也就是说下面的字符串的开始或者结束都不会有换行符：
    let signalLine = """
    单行单行
    """
    print(signalLine)
    
    
    
    let multipleLine = """
    离离原上草，一岁一枯荣。
    野火烧不尽，春风吹又生。
    """
    print(multipleLine)
    
    
    // 多行字符串，添加换行的两种方式
    // 方式一：直接回车，添加换行
    // 方式二：\n
    print("开始========")
    let lineBreak = """

    离离原上草，一岁一枯荣。\n
    野火烧不尽，春风吹又生。

    """
    print(lineBreak)
    print("结束========")
    
    
    
    // MARK: 字符串字面量里的特殊字符
    /*
     转义特殊字符 \0 (空字符)， \\ (反斜杠)， \t (水平制表符)， \n (换行符)， \r(回车符)， \" (双引号) 以及 \' (单引号)；
     任意的 Unicode 标量，写作 \u{n}，里边的 n是一个 1-8 个与合法 Unicode 码位相等的16进制数字。
     */
    let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
    // "Imagination is more important than knowledge" - Einstein
    let dollarSign = "\u{24}" // $, Unicode scalar U+0024
    let blackHeart = "\u{2665}" // ♥, Unicode scalar U+2665
    let sparklingHeart = "\u{1F496}" // 💖️, Unicode scalar U+1F496
    
    print("wiseWords is \(wiseWords)")
    print("dollarSign is \(dollarSign)")
    print("blackHeart is \(blackHeart)")
    print("sparklingHeart is \(sparklingHeart)")
    
    
    // 由于多行字符串字面量使用三个双引号而不是一个作为标记，你可以在多行字符串字面量中包含双引号（ " ）而不需转义。要在多行字符串中包含文本 """ ，转义至少一个双引号。比如说：
    let threeDoubleQuotationMarks = """
    Escaping the first quotation mark \"""
    Escaping all three quotation marks \"\"\"
    """
    print("threeDoubleQuotationMarks is \(threeDoubleQuotationMarks)")
    
    
    
    // MARK: 扩展字符串分隔符
    
    // #字符串# --> 字符串中的 \n 不会生效
    let expandString = #"Line1 \n Line2"#
    print("expandString is \(expandString)")
    
    let expandString2 = ###"Line1\###nLine2"###
    print("expandString2 is \(expandString2)")
    
    let threeMoreDoubleQuotationMarks = #"""
    Here are three more double quotes: """
    """#
    print("threeMoreDoubleQuotationMarks is \(threeMoreDoubleQuotationMarks)")
    
    
    // MARK: 初始化一个空字符串
    let emptyString = ""
    if emptyString.isEmpty {
        print("emptyString is empty")
    }
    
    
    // MARK: 字符串可变性
    var varString = "one"
    varString += "two"
    print("varString is \(varString)")
    
    
    // MARK: 字符串是值类型
    var str1 = "str1"
    var str2 = str1
    var str3 = str2
    print("str1变量的地址", Mems.ptr(ofVal: &str1))
    print("str2变量的地址", Mems.ptr(ofVal: &str2))
    print("str3变量的地址", Mems.ptr(ofVal: &str3))
    
    /*
     输出结果：
     str1变量的地址 0x00007ffeefbff210
     str2变量的地址 0x00007ffeefbff200
     str3变量的地址 0x00007ffeefbff1f0
     
     结论：
     Swift 的 String类型是一种值类型。如果你创建了一个新的 String值， String值在传递给方法或者函数的时候会被复制过去，还有赋值给常量或者变量的时候也是一样。每一次赋值和传递，现存的 String值都会被复制一次，传递走的是拷贝而不是原本。
     
     优点：
     Swift 的默认拷贝 String行为保证了当一个方法或者函数传给你一个 String值，你就绝对拥有了这个 String值，无需关心它从哪里来。你可以确定你传走的这个字符串除了你自己就不会有别人改变它。

     另一方面，Swift 编译器优化了字符串使用的资源，实际上拷贝只会在确实需要的时候才进行。这意味着当你把字符串当做值类型来操作的时候总是能够有用很棒的性能。
     */
    
    // MARK: 操作字符串
    for character in "Cat!🐱️" {
        print(character)
    }
    
    // Character数组构造字符串
    let catCharacter: [Character] = ["C", "a", "t", "!", "🐱️"]
    let catString = String.init(catCharacter)
    print(catString)
    
    // UnsafePointer
    
    // 遍历字符串中的字符
    let numbers = [2, 3, 5, 7]
    var numbersIterator = numbers.makeIterator()
    while let num = numbersIterator.next() {
        print(num)
    }
    
    
    // 排序
    var interestingNumbers = [
        "primes" : [2, 3, 4, 11, 13, 19],
        "triangular" : [1, 3, 5, 9, 2]
    ]
    
    for key in interestingNumbers.keys {
        interestingNumbers[key]?.sort(by: >)
    }
    
    print(interestingNumbers["primes"]!)
    
    
    // MARK: 连接字符串和字符
    let appendString1 = "hello"
    let appendString2 = "world"
    let appendString3 = appendString1 + appendString2
    print(appendString3)
    
    
    // MARK: 字符串插值
    let multiple = 3
    let message = "\(multiple) x 2.5 is \(Double(multiple) * 2.5)"
    print(message)
    
    
    
    // MARK: Unicode
    // MARK: Unicode 标量
    // MARK: 访问和修改字符串
    
    
    // MARK: 字符统计
    var word = "cafe"
    print("the number of character in \(word) is \(word.count)")
    
    word += "\u{301}"
    print("the number of character in \(word) is \(word.count)")
    
    let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
    print(regionalIndicatorForUS)
    
    // MARK: 字符串索引
    // 每一个 String值都有相关的索引类型， String.Index，它相当于每个 Character在字符串中的位置。
    // 如上文中提到的那样，不同的字符会获得不同的内存空间来储存，所以为了明确哪个 Character 在哪个特定的位置，你必须从 String的开头或结尾遍历每一个 Unicode 标量。因此，Swift 的字符串不能通过整数值索引。
    
    // endIndex 不一定等于字符串下标脚本的合法实际参数
    
    let indexString = "ABCD EFGH 🐶"
    print("=======indexString=======")
    print(indexString[indexString.startIndex]) // A
    print(indexString[indexString.index(before: indexString.endIndex)])  // 🐶
    print(indexString[indexString.index(after: indexString.startIndex)]) // B
    print(indexString[indexString.index(indexString.startIndex, offsetBy: 7)])  // G
    print(indexString[indexString.index(indexString.startIndex, offsetBy: 10)]) // 🐶
    // print(indexString[indexString.index(indexString.startIndex, offsetBy: 11)]) 越界
    // print(indexString[indexString.endIndex]) 越界
    // print(indexString[indexString.index(after: indexString.endIndex)]) 越界
    print("indexString.count = \(indexString.count)")
    print("=======indexString=======")
    
    
    // MARK: 插入和删除
    var welcome = "hello"
    welcome.insert("!", at: welcome.endIndex)
    print("welcome is \(welcome)")
    
    // 在末尾字符的前面位置插入 `there`
    welcome.insert(contentsOf: "there", at: welcome.index(before: welcome.endIndex))
    print("welcome is \(welcome)")
    
    // 删除末尾字符
    welcome.remove(at: welcome.index(before: welcome.endIndex))
    print("welcome is \(welcome)")
    
    
    
    print("================String================")
}


// MARK: Substring
func substringSummary() {
    print("================Substring================")
    let greeting = "Hi there! It's nice to meet you! 👋"
    let endOfSentence = greeting.firstIndex(of: "!")!
    let firstSentence = greeting[...endOfSentence]
    print("firstSentence ==\(firstSentence)") // firstSentence == "Hi there!"
    
    let shoutingSentence = firstSentence.uppercased()
    print("shoutingSentence ==\(shoutingSentence)")
    
    
    
    
    
    
    
    
    print("================String================")
}


stringSummary()

substringSummary()
