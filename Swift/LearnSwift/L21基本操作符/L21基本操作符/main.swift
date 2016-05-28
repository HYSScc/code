//
//  main.swift
//  L21基本操作符
//
//  Created by tom-pc on 16/5/9.
//  Copyright © 2016年 tom-pc. All rights reserved.
//

import Foundation

/*
 课时13 Basic Operators
        基础操作符
 */
                                                                        // "=" Assignment Operator
let 常规任务 = 4
var 加班任务 = 2
加班任务 = 常规任务
//print(加班任务)

let (常规任务1, 加班任务1) = (4, 2)

"小波," + "说雨燕"

let dog = "🐶"
let cow = "🐮"
let animal = dog + cow
//print(animal)

                                                                       // Remainder Operator 取余操作符
let 余数 = 9 % 4                                                        // -10对6取余和-10对-6取余相等为-4
//print(余数)


/*
 课时14 Floating-Point Remainder Calcultions
    浮点数取余和自增自减
 */
let a = 1024 % 3.5
var b = Int(1024 / 3.5)                                                // 取整
//print(a, b)

                                                                       // 自增自减
var i = 0
let x = i++                                                            // 先赋值
//print(i, x)

let y = ++i                                                            // 先加数值
//print(i, y)


/*
 课时15 取正负和组合赋值
 */
                                                                      // Unary Minus Operator 一元取负操作符
let 三 = 3
let 负三 = -三
//print(负三)
                                                                      // Unary Plus Operator 一元加法运算符
let 取正 = +负三                                                       // 加号不做任何操作
                                                                      // Compound Assignment Operator 组合赋值运算符
var c = 0
c += 3
//print(c)

var d = 0
//d = c += 2                                                            // 语法错误 不能把组合赋值语句传给d(赋值)



/*
 课时16 Comparison Operators
        比较运算
 */
let 批发价 = 50
let 会员价加价 = 10
let 非会员加价 = 15
let 是否会员 = true

var  最终售价 = 0

if (是否会员) {
    最终售价 = 批发价 + 会员价加价
    print("最终售价是\(最终售价)")
} else {
    最终售价 = 批发价 + 非会员加价
    print("最终售价是\(最终售价)")
}

let 最终售价1 = 批发价 + (是否会员 ? 会员价加价 : 非会员加价)
print("最终售价是\(最终售价1) (三元运算符)")


/*
 课时17 Range Operators : Closed Range Operator/
        闭区间和半开区间
 */
for 年 in (1949...2016) {
    print("我党\(年)为人民服务\(年 - 1949 + 1)年")                          // 闭区间
}


var 群主名单 = ["肉啃肉", "王河", "王思齐"]                                 // 计算下群组的数目
var 群主数目 = 群主名单.count
//print(群主数目)

for 顺序 in 0..<群主数目 {                                                // 半开区间
    print("\(顺序 + 1)群群主是\(群主名单[顺序])")
}


/*
 课时18 Logical Operators
        逻辑运算符
 */
                                                                       // 逻辑非! 逻辑与&& 逻辑或||
let 请进 = false
if !请进 {
    print("2群群主拒绝进入")
}

let 密码正确 = true
let 视网膜不匹配 = false
let 钥匙 = true
if 密码正确 && 视网膜不匹配 || 钥匙 {
    print("Welcome")
} else {
    print("3群群主拒绝进入")
}


/*
 课时18 Nil Coalescing Operator
            空值合并操作符
 */
let 底线品牌 = "小米5"
var 理想品牌: String?
//理想品牌 = "iphone 6"

var 实际入手 = (理想品牌 ?? 底线品牌)
print(实际入手)























