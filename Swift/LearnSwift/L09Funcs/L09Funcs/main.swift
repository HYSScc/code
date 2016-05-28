//
//  main.swift
//  L09Funcs
//
//  Created by tom-pc on 16/5/5.
//  Copyright © 2016年 tom-pc. All rights reserved.
//

import Foundation

func sayHello(word:String){
    print("Hello", 100, word)
}

sayHello("World")

func getWord() -> (String,Int){
    return("NiHao", 1)
}

let (a,b) = getWord()
print(a,b)

var fun = sayHello
fun("zhangsan")

        