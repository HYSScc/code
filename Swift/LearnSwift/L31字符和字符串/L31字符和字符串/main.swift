//
//  main.swift
//  L31字符和字符串
//
//  Created by tom-pc on 16/5/11.
//  Copyright © 2016年 tom-pc. All rights reserved.
//

import Foundation

/*
 课时20 Strings and Characters
        字符和字符串
 */
                                                            // String Literals(字面量)
var 空字符串 = ""
var 空字符串1 = String()
if 空字符串.isEmpty {                                        // 用isEmpty方法判断字符串是否为空
    print("这是个空字符串")                                   // 这是个空字符串
}

                                                            // String Mutability(可修改)
var a = "Hello World"
a = "Hello Swift"
print(a)                                                    // Hello Swift
a += " and World"
print(a)                                                    // Hello Swift and World

for 单个字符 in a.characters {                               // 重点:在a后面要加.characters
    print(单个字符)
}

                                                            // String Interpolation
                                                            // Unicode(万国码)
let 代码 = "\u{9999}"
print(代码)

                                                            // 计算字符串长度用到函数countElements()
print(a.characters.count)

/*
 课时21 Comparing Strings
        字符串比较
 */
let c = "Swift"
let d = "Swift"
if c == d {
    print("两个字符串相等")
}

