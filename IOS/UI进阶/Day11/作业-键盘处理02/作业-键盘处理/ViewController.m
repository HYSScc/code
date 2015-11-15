//
//  ViewController.m
//  作业-键盘处理
//
//  Created by tom-pc on 15/11/12.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "KeyboardTool.h"

@interface ViewController () <KeyboardToolDelegate>{
    NSArray *_field; // 存储所有的textField
}
@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
// 输入框容器
@property (weak, nonatomic) IBOutlet UIView *inputContainer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.初始化自定义键盘
    [self setupCustomKeyboard];
    
    // 2.设置每一个textField的inputAccessoryView(键盘工具条)
    [self setupKeyboardTool];
    
    // 3.监听键盘的事件
    [self setupKeyboardNotification];
    
    NSLog(@"%@", _field); // 添加
}
// 1.初始化自定义键盘
- (void)setupCustomKeyboard{
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    self.birthdayField.inputView = datePicker;
    
}
// 2.设置每一个textField的inputAccessoryView(键盘工具条)
- (void)setupKeyboardTool
{
    // 创建工具栏
    KeyboardTool *tool = [KeyboardTool keyboardTool];
    
    // 设置代理
    tool.delegate = self;
    
    // 1.获取输入框窗口所有子控件
    NSArray *views = self.inputContainer.subviews;
    
    // 创建一个数组存储textField
    NSMutableArray *fieldsM = [NSMutableArray array]; // 添加
    
    // 2.遍历
    for (UIView *child in views) {
        // 如果子控件是UITextField的时候，设置inputAccessoryView
        if ([child isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)child;
            tf.inputAccessoryView = tool;
            // 把textField添加到数组里面
            [fieldsM addObject:tf]; // 添加
        }
    }
    _field = fieldsM; // 添加 将局部变量赋值给全局变量
}

// 3.监听键盘事件
- (void)setupKeyboardNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kbFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
// 键盘的frame变化
- (void)kbFrameChange:(NSNotification *)notifi
{
    NSLog(@"%@", notifi.userInfo);
    // 获取键盘改变后的y值
    // 这是键盘结束时的frame
    CGRect frame = [notifi.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat y = frame.origin.y;
    NSLog(@"%f", y);
    
    // 获取当前响应者的最大y值
    NSInteger currentIndex = [self getCurrentResponderIndex]; // 当前索引
    UITextField *currentTf = _field[currentIndex]; // 当前textField。
    CGFloat tfMaxY = CGRectGetMaxY(currentTf.frame) + self.inputContainer.frame.origin.y;
    NSLog(@"%f %f", y, tfMaxY);
    
    // 改变控制器view的transform
    
    // 如果textField的最大值大于键盘的y值，才需要往上移。
    if (tfMaxY > y) {
        
        [UIView animateWithDuration:0.25 animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, y - tfMaxY);
        }];
        
        
    }
}

// 点击空白部分隐藏键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
}
#pragma mark - 键盘工具条的代理
// 实现代理方法,实现按钮的监听
- (void)keyboardTool:(KeyboardTool *)keyboardTool didClickItemType:(KeyboardItemType)itemType
{
    
    // 获取当前的响应者索引
    NSInteger currentIndex = [self getCurrentResponderIndex];
    NSLog(@"当前的响应者%ld", currentIndex);
    
    if (itemType == KeyboardItemTypePrevious) {
        NSLog(@"上一个");
        // 让上一个field成为响应者
        [self showProviousField:currentIndex];
    }else if (itemType == KeyboardItemTypeNext){
        NSLog(@"下一个");
        // 让上一个field成为响应者
        [self showNextField:currentIndex];
    }else{
        NSLog(@"完成");
        [self touchesBegan:nil withEvent:nil];
    }
}


// 获取当前textField响应者索引
// 如果返回-1代表没有找到响应者
- (NSInteger)getCurrentResponderIndex{

    // 遍历所有的textField获取响应者
    for (UITextField *tf in _field) {
        if (tf.isFirstResponder) {
            return [_field indexOfObject:tf]; // 获取索引
        }
        
    }
    return -1;
}

// 让上一个field成为响应者
- (void)showProviousField:(NSInteger)currentIndex{
    
    NSInteger proviousIndex = currentIndex - 1; // 上一个响应者索引
    
    // 判断索引大于0，才能保证是textField的范围内，才能成为响应者。如果是第一个textField，上面再减一，成为负数，就不能成为响应者，符合逻辑。
    if (proviousIndex >= 0) {
        
        // 从数组中拿到索引
        UITextField *provious = [_field objectAtIndex:proviousIndex];
        [provious becomeFirstResponder];
    }
}

// 让下一个field成为响应者
- (void)showNextField:(NSInteger)currentIndex{
    NSInteger nextIndex = currentIndex + 1;
    // 判断最后一个textField索引，再加一是不可取的，所有不能大于它。
    // 下一个的索引，不能超过数组的个数
    if (nextIndex < _field.count) {
        
        // 让当前响应者分发出去
        UITextField *currentTf = [_field objectAtIndex:currentIndex];
        [currentTf resignFirstResponder];

        
        UITextField *next = [_field objectAtIndex:nextIndex];
        [next becomeFirstResponder];
    }
}

@end
