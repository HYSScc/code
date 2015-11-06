//
//  ViewController.m
//  Practice060708
//
//  Created by tom-pc on 15/11/5.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (IBAction)startButton{
    
    // 倒计时10秒，每秒更新一下Label的显示
    // 计时器
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    //    // 将timer添加到运行循环.模型是默认的运行循环模式
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updateTimer:(NSTimer *)timer
{
    NSLog(@"%s", __func__);
    // 1.取出标签中的数字
    int counter = self.counterLabel.text.intValue;
    
    // 2.判断是否为0，停止时钟
    if (--counter < 0) {
        // 停止时钟
        [self pauseButton];
        
        // 提示用户，提示框
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"开始" message:@"开始啦" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
    } else{
        // 3.修改数字并更新UI
        self.counterLabel.text = [NSString stringWithFormat:@"%d", counter];
    }
}

- (IBAction)pauseButton{
    
    // 停止时钟,invalidate唯一停止时钟的方法，一旦调用了invalidate方法，timer就无效了
    // 如果再次启动时钟，需要重新实例化
    [self.timer invalidate];
}

#pragma mark - alertView代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%ld", buttonIndex); // 点击取消返回0，点击确定返回1
}

@end
