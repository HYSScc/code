//
//  main.swift
//  L07Loop
//
//  Created by tom-pc on 16/5/1.
//  Copyright © 2016年 tom-pc. All rights reserved.
//

import Foundation

var arr = [1, "Hello"]

//for value in arr{
//    print(value)
//}

for index in 0...100{
    arr.append("Item \(index)")
}

for value in arr{
//    print(value)
}
                     
//print(arr)

var i = 0

while i<arr.count{

    print(arr[i])
    i += 1
    
}

var dict = ["name":"jekexueyuan","age":"16"]

for (key,value) in dict{
    print(key,value)
}












