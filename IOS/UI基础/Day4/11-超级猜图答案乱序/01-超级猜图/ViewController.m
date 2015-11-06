//
//  ViewController.m
//  01-超级猜图
//
//  Created by tom-pc on 15/10/4.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet UILabel *noLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionView;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton;


@property (nonatomic, strong) UIButton *cover;
@property (nonatomic, strong) NSArray *questionsList;
@property (nonatomic, assign) int index; // 题目索引
@end


@implementation ViewController

- (NSArray *)questionsList
{
    if (_questionsList == nil) {
        _questionsList = [Question questions];
    }
    return _questionsList;
}

- (UIButton *)cover
{
    // 将复制的代码，创建的UIButton *cover改为_cover；
    if (_cover == nil) {
        // 1.添加一个遮罩(遮罩应该是一个按钮类型的)设置完之后，点击按钮，屏幕显现半透明
        _cover = [[UIButton alloc] initWithFrame:self.view.bounds];
        _cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5]; // 颜色设定
        [self.view addSubview:_cover];
        
        // 1.4.添加缩小的动画，按钮监听
        [_cover addTarget:self action:@selector(bigImage) forControlEvents:UIControlEventTouchUpInside];
        
        // 1.5 发现动画中，蒙版是慢慢地变暗，或慢慢地变量
        _cover.alpha = 0.0; // 透明
        
    }
    return _cover;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.index = -1;
    [self nextQuestion];
    

}



//** 调整状态栏颜色 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent; // 亮色状态栏
                                         // UIStatusBarStyleDefault黑色状态栏
}


#pragma mark - 大图小图切换
//** 大图 和 小图*/
- (IBAction)bigImage {
    
    // 如果没有放大，就放大，否则就缩小
    // 通过蒙版的alpha来判断按钮是否已经放大
    if (self.cover.alpha == 0.0) {
        // 1.
//        [self cover]; // 已经调用了get方法，这句可以省略
        
        // 2.将图像按钮弄到最前面
        // bringSubviewToFront将子视图前置
        [self.view bringSubviewToFront:self.iconButton]; //将前面声明的iconButton传人方法，iconButton就是UIButton *
        
        // 3.动画放大图像按钮
        CGFloat w = self.view.bounds.size.width;
        CGFloat h = w;
        CGFloat y = (self.view.bounds.size.height - h) * 0.5 - 21;
        CGFloat x = 0;
        
        // 添加动画(点击按钮后，伴随动画图片放大到指定位置，关键：取消了storyboard中控制器中的一个 use auto layout的选项)
        [UIView animateWithDuration:2.0f animations:^{
            self.iconButton.frame = CGRectMake(x, y, w, h);
            self.cover.alpha = 1.0;
            // 1.5 完全显示（完全显示的是透明度，之前的颜色已经设置好了，不要搞混）
        }];

    } else{
        // 1.3 插入缩小的动画代码
        // 动画一旦定义，马上开始，如果没有将删除cover添加到结束动画中，直接写在动画块代码的外面，一开始执行时，蒙版就消失，我们要的效果是动画结束后消失
        [UIView animateWithDuration:2.5f animations:^{
            // 1.将图像恢复初始位置
            self.iconButton.frame = CGRectMake(110, 110, 150, 150);
            self.cover.alpha = 0.0; // 1.5
        } completion:^(BOOL finished) {
            // 2.动画完成之后删除cover
            // cover是局部变量在这里无法直接删除(方法一在方法添加一个形参，把cover传人到方法中)
            //        [cover removeFromSuperview]; // 懒加载之后，不需要删除蒙版
        }];
    
    }
}


#pragma mark - 下一题
- (IBAction)nextQuestion
{
    // 1. 当前答题的索引，索引递增
    self.index++;
    
    // 添加13如果index已经到最后一题，提示用户，通关
    if (self.index == self.questionsList.count) {
        NSLog(@"通关");
        return;
    }
    
    // 2. 从数组中按照索引取出题目模型数据
    Question *question = self.questionsList[self.index];
    
    // 3. 设置基本信息
    // 3.1 设置标签
    self.noLabel.text = [NSString stringWithFormat:@"%d/%ld", self.index + 1, self.questionsList.count];
    self.titleLabel.text = question.title;
    // 3.2 设置图像
    [self.iconButton setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    // 如果到达最后一题，禁用下一题按钮
    self.nextButton.enabled = (self.index < self.questionsList.count - 1);
    
    // 4. 设置答案按钮
    [self createAnswerButtons:question];
    
    
    // 5. 这是备选按钮
    [self createOptionButtons:question];
    }

/** 创建答案区按钮 */
- (void)createAnswerButtons:(Question *)question
{
#define kButtonW 35
#define kButtonH 35
#define kButtonM 10 // 按钮的间距
#define kTotolCol 7
    
    // 首先清除掉答题区内的所有按钮
    // 所有的控件都继承自UIView，（把UIButton -> UIView）多态的应用
    for (UIView *btn in self.answerView.subviews) {
        [btn removeFromSuperview];
    }
    
    
    CGFloat answerW = self.answerView.bounds.size.width;
    NSUInteger length = question.answer.length;
    CGFloat answerX = (answerW - kButtonW * length - kButtonM * (length - 1)) * 0.5;
    
    // 创建所有答案的按钮
    for (int i = 0; i < length; i++) {
        CGFloat x = answerX + i * (kButtonW + kButtonM);
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, kButtonW, kButtonH)];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal]; // 设置字体颜色
        
        [self.answerView addSubview:btn];
        
        // 14添加监听方法
        [btn addTarget:self action:@selector(answerClick:) forControlEvents:UIControlEventTouchUpInside];
    }

}

/** 创建备选区按钮 */
- (void)createOptionButtons:(Question *)question
{
    // 问题：每一次调用下一题方法时，都会重新创建21个按钮
    // 解决方法：如果按钮已经存在，并且是21个，只需要更改按钮标题即可
    if (self.optionView.subviews.count != question.options.count) {
        // 重新创建所有按钮
        // 清除按钮
        for (UIButton *btn in self.optionView.subviews)
        {
            [btn removeFromSuperview];
        }
        
        CGFloat optionW = self.optionView.bounds.size.width;
        CGFloat optionX = (optionW - kTotolCol * kButtonW - (kTotolCol - 1) *kButtonM) * 0.5;
        
        for (int i = 0; i < question.options.count; i++) {
            int row = i / kTotolCol; // 行
            int col = i % kTotolCol; // 列
            
            CGFloat x = optionX + col * (kButtonM + kButtonW);
            CGFloat y = row * (kButtonM + kButtonH);
            
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, kButtonW, kButtonH)];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
            
            // 设置备选答案
//            [btn setTitle:question.options[i] forState:UIControlStateNormal];
            // 设置字体颜色
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [self.optionView addSubview:btn];
            
            // 13-添加按钮监听方法
            [btn addTarget:self action:@selector(optionClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        NSLog(@"创建候选按钮");
    }
    
    // 如果按钮已经存在，在点击下一题的时候，只需要设置标题
    int i = 0;
    
//    // 让模型打乱数据
//    [question randamOptions];
    
    for (UIButton * btn in self.optionView.subviews) {
        // 设置备选答案
        [btn setTitle:question.options[i++] forState:UIControlStateNormal];
        
        // 添加13恢复所有按钮的隐藏状态
        btn.hidden = NO;
        
//        // 13-添加按钮监听方法
        // 提示：如果在此添加监听方法，意味着每次都要调用下一题的时候都会添加监听方法
//        [btn addTarget:self action:@selector(optionClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    NSLog(@"%ld", self.optionView.subviews.count);
}



#pragma mark - 候选按钮点击
/** 候选按钮点击 */
- (void)optionClick:(UIButton *)button
{
    NSLog(@"%s", __func__);
    // 1. 在答案区找到第一个文字为空的按钮
    UIButton *btn = [self firstAnswerButton];
    
    // 如果没有找到按钮=>所有的答题按钮都有字，就直接返回
    if (btn == nil) {
        // 都有字判断胜负
        
    } else
    {
        // 2. 将button的标题设置给答案区的按钮
        [btn setTitle:button.currentTitle forState:UIControlStateNormal];
        
        // 3. 将button隐藏
        button.hidden = YES;
    }
    // 4.判断结果
    [self judge];
    
}

/** 判断结果 */
- (void)judge
{
    // 如果四个按钮都有文字，才需要判断结果
    // 遍历所有答题区的按钮
    BOOL isFull = YES;
    
    NSMutableString *strM = [NSMutableString string];
    
    for (UIButton *btn in self.answerView.subviews) {
        if (btn.currentTitle.length == 0) {
            // 只要有一个按钮没有字
            isFull = NO;
            break;
        }else
        {
            // 有字，拼接临时字符串
            [strM appendString:btn.currentTitle];
        }
    }
    
    if (isFull) {
        NSLog(@"都有字");
        // 判断是否和答案一致
        // 取出self.index获得当前的question
        Question *question = self.questionsList[self.index];
        
        // 如果一致，进入下一题
        if ([strM isEqualToString:question.answer]) {
            NSLog(@"答对了");
            [self setAnswerButtonColor:[UIColor blueColor]];
            
            // 增加分数
            [self changeScore:800];
            
            // 等待0.5秒，进行下一题
            [self performSelector:@selector(nextQuestion) withObject:nil afterDelay:0.5];
        }else
        {
            // 如果不一致，修改字体颜色，提示用户
            NSLog(@"打错了");
            [self setAnswerButtonColor:[UIColor redColor]];
        }
        
        
        
    }else
    {
        NSLog(@"继续");
    }

}

/** 修改答题区按钮的颜色 */
- (void)setAnswerButtonColor:(UIColor *)color
{
    for (UIButton *btn in self.answerView.subviews) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
}

// 1. 在答案区找到第一个文字为空的按钮
- (UIButton *)firstAnswerButton
{
    // 取按钮的标题
    // 遍历答题区所有按钮
    for (UIButton *btn in self.answerView.subviews) {
        if (btn.currentTitle.length == 0) // 判断answer按钮是否为空，currentTitle返回是字符串，所以调用了length方法，length指的是每一个subView里的文字个数。判断
        {
            return btn;
        }
    }
    return nil;
}

#pragma mark - 答题区按钮点击方法
- (void)answerClick:(UIButton *)button
{
    // 1.如果按钮没有字，直接返回
    if (button.currentTitle.length == 0) return;
    
    // 2.如果有字，清除文字，候选区按钮显示
    // 1> 使用button的title去查找候选区中对应的按钮
    UIButton *btn = [self optionButtonWithTitle:button.currentTitle];
    // 2> 显示对应按钮
    btn.hidden = NO;
    // 3> 清除button文字
    [button setTitle:@"" forState:UIControlStateNormal];
    
    // 4> 只要点击了按钮上的文字，意味着答题区的内容不完整
    [self setAnswerButtonColor:[UIColor blackColor]];
}

- (UIButton *)optionButtonWithTitle:(NSString *)title
{
    // 遍历候选区中的所有按钮
    for (UIButton *btn in self.optionView.subviews ) {
        if ([btn.currentTitle isEqualToString:title] && btn.isHidden) {
            return btn;
        }
    }
    
    return nil;
}

#pragma mark - 提示功能
- (IBAction)tipClick
{
    // 1. 把答题区的所有按钮清空
    for (UIButton *btn in self.answerView.subviews) {
        // 用代码执行点击答题按钮的操作
        [self answerClick:btn];
    }
    // 2. 把正确答案的第一个字，设置到答案区中
    // 1> 知道答案的第一个字
    Question *question = self.questionsList[self.index];
    // 月光宝盒,取出第一个答案的文字
    NSString *first = [question.answer substringToIndex:1];
    // 取出文字对应的候选按钮，模拟点击
    for (UIButton *btn in self.optionView.subviews ) {
        if ([btn.currentTitle isEqualToString:first] && !btn.isHidden) {
            [self optionClick:btn];
            
            break;
        }
    }
    
    
    // 扣分
    [self changeScore:-1000];

}

#pragma mark - 分数处理
- (void)changeScore:(int)score
{
    // 取出当前的分数
    int currentScore = self.scoreButton.currentTitle.intValue;
    // 使用score调整分数
    currentScore += score;
    // 重新设置分数
    [self.scoreButton setTitle:[NSString stringWithFormat:@"%d", currentScore] forState:UIControlStateNormal];
}

#pragma mark - 答案乱序


@end
