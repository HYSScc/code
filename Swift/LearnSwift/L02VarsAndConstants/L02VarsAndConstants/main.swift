//
//  main.swift
//  L02VarsAndConstants
//
//  Created by tom-pc on 16/5/1.
//  Copyright © 2016年 tom-pc. All rights reserved.
//

import Foundation
// \()插值

var a = 1
a = 10
var b = 2

var e = 3, r = 4, f = 5

var q:String = "NiHao"

let w:Int = 0

let c = a+b

let minValue = Int.min

let maxValue = Int.max

let minValue1 = UInt8.min

let maxValue1 = UInt8.max

let 十进制的10 = 10
let 八进制的8 = 0o10
let 二进制的2 = 0b10
let 十六进制的16 = 0x10

// 一乘以10的6次方
let 一百万 = 1e6
let 一百万分之一 = 1e-6

// 十六进制15的二次方
let 十六进制15的二次方 = 0xFp2

// 类型转化(范围小的量转化为范围比较大的量)
let o:Int16 = 100
let p:Int8 = 10

let l = o + Int16(p)

let 三 = 3
let 零点一四一五 = 0.1415

let 圆周率 = Double(三) + 零点一四一五
let 圆周率的整数位 = Int(圆周率) // 截取
// 变量之间的相加相减需要类型的转化，而字面量之间的相加相减可以直接进行

// 类型别名
typealias 整形 = Int

let aa:整形 = 100

//Bool
let 橘子是橙色的 = true
let 萝卜好吃 = false

if 萝卜好吃 {
    print("我还要吃")
} else {
    print("我不要吃")
}

// 元组
let 昨天网购了一双鞋 = (43, "白色", true)
//let (鞋码, 颜色, 合脚) = 昨天网购了一双鞋

let 昨天网购了一双鞋1 = (大小:43, 颜色:"白色", 合生:true)

//optional
let 昨天买的彩票 = "50"
let 彩票金额 = 昨天买的彩票

print(彩票金额)

print(昨天网购了一双鞋.2)

print(昨天网购了一双鞋1.大小)

print(minValue, maxValue, minValue1, maxValue1)

print(十进制的10, 八进制的8, 二进制的2, 十六进制的16)

print(一百万, 一百万分之一, 十六进制15的二次方)

print(l, 圆周率, 圆周率的整数位, aa)

