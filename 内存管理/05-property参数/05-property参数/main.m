//
//  main.m
//  05-property参数
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[])
{
    
    
    Person *p = [[Person alloc] init];
    
    [p setrich:YES];
    
    BOOL b = p.isRich;
    
    
    
    NSLog(@"%d", [p abc]);
    
    return 0;
}
