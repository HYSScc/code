//
//  main.swift
//  L11Swift基础
//
//  Created by tom-pc on 16/5/9.
//  Copyright © 2016年 tom-pc. All rights reserved.
//

import Foundation

/* 
 课时2 ConstantsAndVariables
        常量与变量
 */
let maxLoginAttempts = 10                                       // 常量一旦定义无法更改
var currentLoginAttempts = 1                                    // 变量可以更改

var x = 1.0, y = 2.0, z = 3.0                                   // 一次定义多个变量
let PI = 3.14159, SPEEDOFLIGHT = 300_000_000                    // 定义常量一般用大写表示

var currentLoginAttempts1: Int = 0                              // 指定类型
var currentLoginName: String = "362190221"                      // Swift有自动识别功能

var 当前登录账号 = "362190221"                                    // 可以用中文命名
var 🌱 = "tree"                                                 // 可以用符号命名

print("圆周率的值是\(PI)", "尝试登录了\(currentLoginAttempts)次")   // 插值


/*
  课时3 Integers
        整数类型
 */
                                                                // 两种:signedAndUnsigned带符号和不带符号
let minValue = UInt8.min                                        // U表示不带符号 8表示位数
let maxValue = UInt8.max                                        // 2的八次方等于256-1=255 因为包含了0
//print(minValue, maxValue)

let minValue1 = Int.min                                         // -2的64次方 不要在类型后面加数字上两行代码
let maxValue1 = Int.max                                         // 2的63次方 根据cpu的型号决定
let minValue2: Int = 0                                          // 这么定义就好了
//print(minValue1, maxValue1)


/*
 课时4 Float
      浮点型
 */
                                                                // 两种:DoubleAndFloat
                                                                // Float32位 Double64位 
                                                                // Float精确到小幅点后6位Double有15位
let PI1:Float = 3.1234567890                                    // 一般都是用Double
let PI2:Double = 3.1234567890                                   // 默认Double类型
//print(PI1, PI2)


/*
 课时5 Type Safety Type Inference
        类型安全和类型推断
 */
                                                                // Swift是一个类型安全语言(强类型语言)
                                                                // literal value 字面量


/*
 课时6 Numeric Literals
        数值型字面量
 */
                                                                // 四种进制表示:decimal(十),binary(二),
                                                                // octal(八),hexadecimal(十六)
let decimal = 10                                                // 十进制的十
let binary = 0b10                                               // 二进制的二
let octal = 0o10                                                // 八进制的八
let hexadecimal = 0x10                                          // 十六进制的十六
//print(decimal, binary, octal, hexadecimal)

let 一百万 = 1_000_000
let 一百万1 = 1e6                                                // 一乘以十的六次方 默认Double
//print(一百万, 一百万1)

let 一百万分之一 = 1e-6                                           // Swift2.0中
//print(一百万分之一)

let 十六进制15的二次方 = 0xFp2                                     // 十六进制以二为基底p表示乘
let 十六进制10的二次方 = 0xAp2
let 十六进制11的二次方 = 0xBp2
let 十六进制12的二次方 = 0xCp2
let 十六进制13的二次方 = 0xDp2
let 十六进制14的二次方 = 0xEp2
//print(十六进制10的二次方, 十六进制11的二次方, 十六进制12的二次方, 十六进制13的二次方, 十六进制14的二次方)

let 十亿人民币 = 1_000_000_000
let 五块钱 =    0_000_000_005
//print(十亿人民币, 五块钱)


/*
 课时7 Numeric Type Conversion
        数值类型转化和类型别名
 */
let a: UInt8 = 255                                              // 不能超过类型范围0~255

let a1: Int8 = 100
let a2: Int16 = 10
let a3 = Int16(a1) + a2                                         // 不能直接相加 a1 + a2
//print(a3)

let 三 = 3
let 零点一四一五九 = 0.14159
let 圆周率 = Double(三) + 零点一四一五九                            // 同样需要将整形转换成浮点型
let 圆周率位数 = Int(圆周率)                                       // 截取整形的位数,不是四舍五入
//print(圆周率, 圆周率位数)                                        // 转换规则:一般转换成范围大的那个

let 圆周率2 = 3 + 0.14159                                        // 类型转换(变量之间)与字面量无关
//print(圆周率2)

typealias 整形 = Int                                             // 类型别名
let a4: 整形 = 3
//print(a4)


/*
 课时8 Booleans
        布尔
 */
let 橘子是橙色的 = true
let 萝卜好吃 = false
if (萝卜好吃) {
    print("我还要吃萝卜")
} else {
    print("我不要吃萝卜")
}

let a5 = 5
if (a5 == 2) {
    print("a5等于2")
} else {
    print("a5等于5")
}


/*
 课时9 Tuple
        元组
 */
let Air_Force_One = (43, "白色", true)
let (大小, 颜色, 合脚) = Air_Force_One
//print(大小, Air_Force_One.1, 合脚)                                // 两种方法取出元组中的值

let Air_Force_1 = (大小:43, 颜色:"白色", 合脚:true)
//print(Air_Force_1.大小, Air_Force_1.颜色, Air_Force_1.合脚)        // 第三种方法定义元组

let Air_Force = (大小:43, 颜色:"白色", 合脚:true)                     // 判断
if (Air_Force.合脚) {
    print("看，新买的\(颜色)的Air Force One，帅不帅!")
} else {
    print("坑爹了!!!")
}


/*
 课时10 Optionals
        可选类型
 */
                                                                   // 当一个值不确定的时候我们用到Optoinal
                                                                   // 拆包和绑定
let 昨天买的彩票 = "50"
let 彩票金额 = Int(昨天买的彩票)                                       // Swift2.0中需要加.toInt()
if ((彩票金额) != nil) {
    print("恭喜中了\(彩票金额)元")
} else {
    print("谢谢惠顾!!!")                                             // 如果彩票金额为空 则执行
}
if ((彩票金额) != nil) {
    print("恭喜中了\(彩票金额!)元 拆包")                               // 拆包"!" 前提是有值
} else {
    print("谢谢惠顾!!!")                                             // 如果彩票金额为空 则执行
}
//print(彩票金额)

                                                                    // if let optional绑定
if let 临时金额 = 彩票金额 {
    print("恭喜中了\(临时金额)元 常量绑定")
} else {
    print("下次加油")                                                 // 如果彩票金额为空 则执行
}

if var 临时金额 = 彩票金额 {                                            // 绑定可以实现变量的调用
    var 税后金额 = Double(临时金额) * 0.8
    print("恭喜中了\(税后金额)元 变量绑定后调用")
}


/*
 课时11 Optional
        可选类型
 */
                                                                      // 间接拆包
let 彩票: String! = "5"
let 彩票1: String? = "5"
//print("此次的彩票金额是\(彩票)元 间接拆包")
//print("此次的彩票金额是\(彩票1)元")
if let 临时金额1 = 彩票 {
    print("此次的彩票金额是\(临时金额1)元")
}


/*
 课时12 Assertions
        断言
 */
var 年龄 = 17

assert(年龄>18, "必须年满18才可继续完本游戏")
















