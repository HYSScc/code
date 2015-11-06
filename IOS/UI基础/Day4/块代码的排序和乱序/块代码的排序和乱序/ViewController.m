//
//  ViewController.m
//  块代码的排序和乱序
//
//  Created by tom-pc on 15/10/4.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad

{
    [super viewDidLoad];
    
    // 块代码
    NSArray *array = @[@(1), @(2), @(3), @(4), @(5)];
    
    // for in对数组的遍历
//    int i = 0;
//    for (NSNumber *num in array) {
//        NSLog(@"%@", num);
//        
//        if (i == 1) {
//            break;
//        }
//        i++;
//    }
    
    
    // 乱序
    array = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *num1, NSNumber *num2) {
        // 乱序-> 一会儿升序，一会儿降序
        // 随机
//        arc4random_uniform(10); -> 生成一个0~9之间的随机数
        int seed = arc4random_uniform(2);
        if (seed) {
            return [num1 compare:num2];
        }else{
            return [num2 compare:num1];
        }
    }];
    
    NSLog(@"%@", array);
    
    
    
//    // 块代码数组的排序
//    array = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *num1, NSNumber *num2) {
//        
//        /**
//         1 4 5 2
//         4 1 5 2
//         4 1 5 2
//         5 4 1 2
//         5 4 1 2
//         5 4 2 1
//         */
//        
//        NSLog(@"%@ %@", num1, num2);
//        
//        return [num2 compare:num1]; // 降序,num1和num2交换位置变为升序
//    }];
//    
//    NSLog(@"%@", array);

    
    
}

// 块代码数组的排序(升序，降序)
- (void)sortWith:(NSArray *)array
{
    // 块代码数组的排序
    array = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *num1, NSNumber *num2) {
        
        /**
         1 4 5 2
         4 1 5 2
         4 1 5 2
         5 4 1 2
         5 4 1 2
         5 4 2 1
         */
        
        NSLog(@"%@ %@", num1, num2);
        
        return [num2 compare:num1]; // 降序,num1和num2交换位置变为升序
    }];
    
    NSLog(@"%@", array);
}

// 块代码数组的遍历
- (void)arrayWith:(NSArray *)array
{

    // 参数：对象，索引，是否中断
    // 数组的快方法遍历的效率比for in高
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@", obj);
        
        // idx == 1 退出循环
        if (idx == 1) {
            *stop = YES;
        } // 在第二个数组元素时，就停止输出
        
    }];
}

@end
