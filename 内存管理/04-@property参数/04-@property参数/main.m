//
//  main.m
//  04-@property参数
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Person.h"
int main(int argc, const char * argv[])
{
    
    Book *b = [[Book alloc] init];
    Person *p = [[Person alloc] init];
    
    p.book =b;
    
    NSLog(@"%ld", [b retainCount]);
    
    [p release];
    [b release];
    return 0;
}
