//
//  ViewController.m
//  02-按钮
//
//  Created by tom-pc on 15/9/26.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

// 枚举类型本质上就是整数，定义的时候，如果只指定第一个数值，后续的数值依次递增
// 枚举类型是解决魔法数字比较常用的手法
typedef enum {
    kMovingTop = 10,
    kMovingBottom,
    kMovingLeft,
    kMovingRight,
} kMovingDir;

// 宏定义
#define kMovingDelta 20.0f


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *iconButton;


@end

@implementation ViewController

// 优化方法，让重复代码只出现一次
- (IBAction)move:(UIButton *)button
{
    
    // 1.取出frame
    CGRect frame = self.iconButton.frame;
    
    // 2.根据按钮的类型，判断移动的方向，再修改结构体的成员
    // magic number魔法数字
    switch (button.tag) {
        case kMovingTop:        // 上
            frame.origin.y -= kMovingDelta;
            break;
        case kMovingBottom:        // 下
            frame.origin.y += kMovingDelta;
            break;
        case kMovingLeft:        // 左
            frame.origin.x -= kMovingDelta;
            break;
        case kMovingRight:        // 右
            frame.origin.x += kMovingDelta;
            break;
    }
    
    // 3.重新为对象的结构体属性赋值
    self.iconButton.frame = frame;
}




// 向上移动
- (IBAction)top:(id)sender
{
    // 修改位置可以用frame
    // 在OC中，不允许直接修改对象的结构体属性的成员
    // 但是允许修改结构体属性的成员
   // self.iconButton.frame.origin.y = 20;
    
    // 如果要修改对象的结构体属性，需要三个步骤
    // 1.取出frame
    CGRect frame = self.iconButton.frame;
    // 2.修改结构体的成员
    frame.origin.y -= 20;
    // 3.重新为对象的结构体属性赋值
    self.iconButton.frame = frame;
    
}

// 向下移动
- (IBAction)bottom:(id)sender
{
    // 1.取出frame
    CGRect frame = self.iconButton.frame;
    // 2.修改结构体的成员
    frame.origin.y += 20;
    // 3.重新为对象的结构体属性赋值
    self.iconButton.frame = frame;
}

// 向左移动
- (IBAction)left:(id)sender
{
    // 1.取出frame
    CGRect frame = self.iconButton.frame;
    // 2.修改结构体的成员
    frame.origin.x -= 20;
    // 3.重新为对象的结构体属性赋值
    self.iconButton.frame = frame;
}

// 向右移动
- (IBAction)right:(id)sender
{
    // 1.取出frame
    CGRect frame = self.iconButton.frame;
    // 2.修改结构体的成员
    frame.origin.x += 20;
    // 3.重新为对象的结构体属性赋值
    self.iconButton.frame = frame;
}



@end
