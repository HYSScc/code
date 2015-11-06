//
//  ViewController.m
//  Practice01
//
//  Created by tom-pc on 15/11/6.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

#define xButtonW 35
#define xButtonH 35
#define xButtonPadding 10
#define xTotolCol 7

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet UILabel *noLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionView;


@property (nonatomic, strong) UIButton *cover;
@property (nonatomic, strong) NSArray *questionModelList;
@property (nonatomic, assign) int index; // 题目索引
@end

@implementation ViewController

// 调整状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UIButton *)cover
{
    if (_cover == nil) {
        _cover = [[UIButton alloc] initWithFrame:self.view.bounds];
        _cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        [self.view addSubview:_cover];
        
        [_cover addTarget:self action:@selector(bigImage) forControlEvents:UIControlEventTouchUpInside];
        
        // 添加，动画会从0.0 -> 0.5 -> 1.0 而不是开始动画直接 从0.5 -> 1.0
        _cover.alpha = 0.0; // 透明
    }
    return _cover;
}

- (NSArray *)questionModelList
{
    if (_questionModelList == nil) {
        _questionModelList = [Question questionModel];
    }
    return _questionModelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = -1;
    [self nextQuestion:self];
    
    NSLog(@"%@", self.questionModelList);
}

- (IBAction)bigImage {
    
    NSLog(@"%s", __func__);
    
    // 如果没有放大就缩小，通过cover的alpha判断
    if (self.cover.alpha == 0.0) {
        // 1.添加遮罩
        [self cover];
        
        // 2.将图像按钮前置
        // bringSubviewToFont将子视图前置
        [self.view bringSubviewToFront:self.iconButton];
        
        // 3.动画放大图像按钮
        CGFloat w = self.view.bounds.size.width;
        CGFloat h = w;
        CGFloat x = 0;
        CGFloat y = (self.view.bounds.size.height - h) * 0.5 - 21;
        
        // 添加动画(点击按钮后，伴随动画图片放大到指定位置，关键：取消了storyboard中控制器中的一个 use auto layout的选项)
        [UIView animateWithDuration:2.0f animations:^{
            self.iconButton.frame = CGRectMake(x, y, w, h);
            self.cover.alpha = 1.0;
        }];

    } else {
        // 4.缩小iconButton
        [UIView animateWithDuration:2.0f animations:^{
            self.iconButton.frame = CGRectMake(110, 110, 150, 150);
            self.cover.alpha = 0.0;
        }];
    }
}

#pragma mark - 下一题
- (IBAction)nextQuestion:(id)sender {
    
    // 1.当前答题的索引，索引递增
    self.index++;
    
    // 2.取出数据
    Question *model = self.questionModelList[self.index];
    
    // 3.设置基本信息
    
    // 标签
    self.noLabel.text = [NSString stringWithFormat:@"%d/%ld", self.index + 1, self.questionModelList.count];
    self.titleLabel.text = model.title;
    
    // 图像
    [self.iconButton setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
    
    // 到达最后一题，禁用下一题按钮
    self.nextButton.enabled = (self.index < self.questionModelList.count - 1);
    
    
    // 4.设置答案按钮
    [self createAnswerButtons:model];
    
    // 5.备选区按钮
    [self createOptionButtons:model];
    
}

// 创建答案区按钮
- (void)createAnswerButtons:(Question *)model
{
    // 首先清除掉答案区内的所有按钮
    // 所有的控件都是继承自UIView。(把UIButton -> UIView) 多态的应用
    for (UIView *btn in self.answerView.subviews) {
        [btn removeFromSuperview];
    }
    
    CGFloat answerW = self.answerView.bounds.size.width;
    NSInteger length = model.answer.length;
    CGFloat answerX = (answerW - xButtonW * length - xButtonPadding * (length - 1)) * 0.5;
    
    // 创建所有按钮
    for (int i = 0; i < length; i++) {
        CGFloat x = answerX + i * (xButtonW + xButtonPadding);
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, xButtonW, xButtonH)];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [self.answerView addSubview:btn];
    }

}

// 创建备选区按钮
- (void)createOptionButtons:(Question *)model
{
    // 问题：每一次调用下一题方法时，都会重新创建21个按钮
    // 解决方法：如果按钮已经存在，并且是21个，只需要更改按钮标题即可
    if (self.optionView.subviews.count != model.options.count) {
        // 清除按钮
        for (UIButton *btn in self.optionView.subviews) {
            [btn removeFromSuperview];
        }
        
        CGFloat optionW = self.optionView.bounds.size.width;
        CGFloat optionX = (optionW - xTotolCol * xButtonW - (xTotolCol - 1) * xButtonPadding) * 0.5;
        
        for (int i = 0; i < model.options.count; i++) {
            int row = i / xTotolCol; // 行
            int col = i % xTotolCol; // 列
            
            CGFloat x = optionX + col * (xButtonW + xButtonPadding);
            CGFloat y = row * (xButtonH + xButtonPadding);
            
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, xButtonW, xButtonH)];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
            // 设置备选区答案
//            [btn setTitle:model.options[i] forState:UIControlStateNormal];
            // 设置字体颜色
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [self.optionView addSubview:btn];
        }
        NSLog(@"创建候选区按钮");
    }
    
    // 前面添加if，如果按钮存在，在点击下一题时，只需要设置标题,将前面循环中的设置标题代码注释
    int i = 0;
    for (UIButton *btn in self.optionView.subviews) {
        // 设置备选区答案
        [btn setTitle:model.options[i++] forState:UIControlStateNormal];
    }
    NSLog(@"%ld", self.optionView.subviews.count);
}

@end
