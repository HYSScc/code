//
//  main.m
//  04-02-计算代码行数
//
//  Created by tom-pc on 15/9/13.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 * 考察NSString、NSArray的使用
 * NSFileManager（文件管理）
 */



// 计算单个文件的代码行数
/*
 path : 文件的全路径(可能是文件夹，也可能是文件)
 返回值 int ：代码行数
 */
NSUInteger codeLineCount(NSString *path)
{
    // 1.获得文件管理者，整个程序运行过程中这个 NSFileManager 类只有一个 mgr 对象，调用成千上万遍，返回的是同一个对象
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 2.判断path是文件夹还是文件路径
    BOOL dir = NO; // 标记是否为文件夹
    // 这个路径是否存在
    BOOL exist = [mgr fileExistsAtPath:path isDirectory:&dir]; // path为文件夹，dir返回YES，path为文件，dir返回NO
    
    // 3.如果不存在，直接返回 0；
    if (!exist)
    {
        NSLog(@"文件不存在");
        return 0;
    }
    
    
    
    // 4.说明路径存在
    if (dir) {// 文件夹
        
        //NSLog(@"是个文件夹");
        
        // 装着当前文件夹下面的所有（文件夹，文件）
        NSArray *array = [mgr contentsOfDirectoryAtPath:path error:nil];
        
        //NSLog(@"%@", array); // 打印出文件夹下面的内容
        
        int count = 0;
        
        // 遍历数组中的所有文件（夹）名
        for (NSString *filename in array) {
            
            // 拼接子文件和子文件夹到path路径
            // 子文件（夹）的全路径
            NSString *fullPath = [NSString stringWithFormat:@"%@/%@", path, filename];
            //NSLog(@"%@", fullPath); // 打印出文件夹下面的内容，并拼接了path路径
            
            count += codeLineCount(fullPath); // 拿到一个全路径，然后调用文件方法计算行数，返回到这里与count相加
        }
        
        return count;
    }
    else
    {// 文件
        //NSLog(@"是个文件");
        
        // 1.判断并获取文件的拓展名,将大写的拓展名转换成小写
        NSString *extension = [[path pathExtension] lowercaseString];
        
        // 过滤拓展名
        // 是否与@“”相等
        if (![extension isEqualToString:@"h"]
            && ![extension isEqualToString:@"m"]
            && ![extension isEqualToString:@"c"]
            && ![extension isEqualToString:@"txt"])
        {
            // 文件拓展名不是h 而且也不是m 而且也不是c 返回值为0
            return 0;
        }
        
        //NSLog(@"%@", extension); // 打印出文件拓展名

        
        // 2.加载文件内容
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        //NSLog(@"%@", content); // 打印出文件内容
        
        // 3.将分割好的每一个数组元素
        NSArray *array = [content componentsSeparatedByString:@"\n"];
        
        // 4.将分割好的每一个数组元素打印出来
//        int i = 0;
//        for (NSString *line in array)
//        {
//            NSLog(@"%d - %@", i, line);
//            i++;
//        }
//        NSRange range = [path rangeOfString:@"/Users/tom/Documents/"];
//        NSString *str = [path stringByReplacingCharactersInRange:range withString:@""];
//        
//        NSLog(@"%@ - %ld", str, array.count);
        
        NSLog(@"%@ - %ld", path, array.count); // 打印出每个文件的全路径，和每个文件的代码行数
        
        return array.count; // 获取array中的元素个数
    }
    
    
}

int main()
{
    NSInteger count = codeLineCount(@"/Users/tom/Desktop/111/");
    
    NSLog(@"行数=%ld", count);
    
    return 0;
}
