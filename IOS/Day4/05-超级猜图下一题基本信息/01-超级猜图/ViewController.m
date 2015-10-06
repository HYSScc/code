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
    
    
    NSLog(@"%@", self.questionsList);
//    for (Question * obj in self.questionsList) {
//        NSLog(@"%@", obj);
//    }
 

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
    // 5. 这是备选按钮
    
}





@end
