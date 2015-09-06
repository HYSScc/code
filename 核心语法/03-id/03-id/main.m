//
//  main.m
//  03-id
//
//  Created by tom-pc on 15/9/6.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    NSString *o = [Person new]; // 多态，父类指针指向子类对象
    
    // Person *p = [Person new];
    
    id p = [Person new];
    
    // id == NSObject *
    // 万能指针，能指向\操作任何OC对象
    id d;
    
    [p setAge:10];
    
    [p setObj:@"123334"];
    
    NSLog(@"%d, %@", [p age], [p obj]);
    
    return 0;
}
