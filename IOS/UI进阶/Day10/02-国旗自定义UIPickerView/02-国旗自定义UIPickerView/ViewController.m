//
//  ViewController.m
//  02-国旗自定义UIPickerView
//
//  Created by tom-pc on 15/11/10.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "FlagModel.h"
#import "FlagView.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSArray *flagList;
@end

@implementation ViewController

- (NSArray *)flagList
{
    if (_flagList == nil) {
        _flagList = [FlagModel flagModel];
    }
    return _flagList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.flagList);
}

#pragma mark - PickerView数据源方法
// 组
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// 行
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.flagList.count;
}

#pragma mark - PickerView代理方法
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    FlagModel *model = self.flagList[row];
//    return model.name;
//}
#pragma mark - 通常用于自定pickerView的cellView
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    FlagModel *model = self.flagList[row];
//    UILabel *label = [[UILabel alloc] init];
//    // 自定义view的时候，设置x，y无效，所以不要做无用功
////    label.frame = CGRectMake(10, 10, 200, 44);
//    label.bounds = CGRectMake(0, 0, 200, 60);
//    label.backgroundColor = [UIColor grayColor];
//    label.text = model.name;
    
    // 循环引用
    FlagView *flag = nil;
    // 如果view不为空，代表有可循环使用的view
    if (view != nil) {
        flag = (FlagView *)view;
    }else{
        flag = [FlagView flagView];
    }
    
    // 设置数据
    flag.model = model;
    
    return flag;
}
// 实现cell高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}
@end
