//
//  main.m
//  07-运行循环
//
//  Created by tom-pc on 15/10/10.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main() {
    
    int a = 0;
    while (YES) {
        printf("请输入选择， 0表示退出");
        scanf("%d", &a);
        
        if (a == 0) {
            NSLog(@"程序结束");
            break;
        }else
        {
            NSLog(@"进入%d程序", a);
        
        }
        
        NSLog(@"come here");
    }
    
    
    return 0;
}
