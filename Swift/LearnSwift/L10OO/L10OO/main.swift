//
//  main.swift
//  L10OO
//
//  Created by tom-pc on 16/5/5.
//  Copyright © 2016年 tom-pc. All rights reserved.
//

import Foundation

class Hi{

    func sayHi(){
    
        print("Hi jikexueyuan")
    }
}

class Hello:Hi{
    
    var _name:String
    
    // 构造方法
    init(name:String) {
        self._name = name
    }
    
    // 重写
    override func sayHi() {
        print("Hello \(self._name)")
    }
    
}

var hi = Hi()
hi.sayHi()

var h = Hello(name: "ZhangSan")
h.sayHi()
