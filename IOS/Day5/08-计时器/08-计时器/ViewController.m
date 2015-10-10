//
//  ViewController.m
//  08-计时器
//
//  Created by tom-pc on 15/10/10.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController
/** 开始 */
- (IBAction)start
{
    // 倒计时10秒，每秒更新一下label的显示
    // 计时器
    /**
     参数说明
     
     1> 时间间隔，double
     2> 监听时钟触发的对象
     3> 调用方法
     4> userInfo，可以是任意对象，通常传递nil
     5> repeats：是否重复
     */
    // 第一部分
    // scheduledTimerWithTimeInterval本质上就是创建一个时钟，添加到运行循环的模式是NSDefaultRunLoopMode
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:@"hello timer" repeats:YES];
    
    // 第二部分，与第一部分等价
//    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
//    // 将timer添加到运行循环
//    // 模式是默认的运行循环
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
    // 第三部分
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    // 将timer添加到运行循环
    // 模式是Common的运行循环
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

// 时钟的更新方法
- (void)updateTimer:(NSTimer *)timer
{
    NSLog(@"%s", __func__);
    // 1.取出标签中的数字
    int counter = self.counterLabel.text.intValue;
    
    // 2.判断是否为0，如果为0，停止时钟
    if (--counter < 0) {
        // 停止时钟
        [self pause];
        
        // 提示用户（提示框）其中用到代理
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"开始" message:@"开始了--" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil]; // nil相当于数组中的最后一个元素。表示到这里就结束了。
        [alert show];
        
    }else{
        // 3.修改数字并更新
        self.counterLabel.text = [NSString stringWithFormat:@"%d", counter];
    }
    
    
}

/** 暂停 */
- (IBAction)pause
{
    // 停止时钟,invalidate是唯一停止时钟的方法
    // 一旦调用了invalidate方法，timer就无效了，如果再次启动时钟，必须重新实例化
    [self.timer invalidate];
}

    
#pragma mark - alertView代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%ld", buttonIndex); // 点击取消，返回0，点击确定，返回1
}


@end
