//
//  ViewController.m
//  01-点菜系统Date Picker
//
//  Created by tom-pc on 15/11/10.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSArray *foodsData;

@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainFoodLabel;
@property (weak, nonatomic) IBOutlet UILabel *juiceLabel;


@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ViewController
#pragma mark - 懒加载食物数据
- (NSArray *)foodsData
{
    if (_foodsData == nil) {
        _foodsData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil]];        
    }
    return _foodsData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.foodsData);
    
    // 初始化label的数据
    self.fruitLabel.text = self.foodsData[0][0];
    self.mainFoodLabel.text = self.foodsData[1][0];
    self.juiceLabel.text = self.foodsData[2][0];
}

#pragma mark - Picker的数据源方法
// 组数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foodsData.count;
}

// 行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *items = self.foodsData[component];
    return items.count;
}
#pragma mark - Picker代理
// 设置内容在代理方法中实现
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    // 1.获取对应的数据
    NSArray *items = self.foodsData[component];
    
    return items[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%ld %ld", component, row);
    
    // 获取对应组的数据
    NSArray *item = self.foodsData[component];
    
    // 实现切换菜单,更新label数据
    if (component == 0) {
        self.fruitLabel.text = item[row];
    } else if (component == 1){
        self.mainFoodLabel.text = item[row];
    } else if (component == 2){
        self.juiceLabel.text = item[row];
    }
    
}
#pragma mark - 随机按钮的实现
- (IBAction)randomMenu {
    // 第一种方法
    // 随机第一组的数据
//    int row1 = arc4random_uniform(12);
//    int row2 = arc4random_uniform(15);
//    int row3 = arc4random_uniform(10);
//    
//    // 更新label数据
//    [self pickerView:nil didSelectRow:row1 inComponent:0];
//    [self pickerView:nil didSelectRow:row2 inComponent:1];
//    [self pickerView:nil didSelectRow:row3 inComponent:2];
//    NSLog(@"%d", row1);
//    
//    // 更新pickerView选中的行
//    [self.pickerView selectRow:row1 inComponent:0 animated:YES];
//    [self.pickerView selectRow:row2 inComponent:1 animated:YES];
//    [self.pickerView selectRow:row3 inComponent:2 animated:YES];
    
    // 第二种方法
    NSInteger colum = self.foodsData.count;
    for (int i = 0; i<colum ; i++) {
        // 获取旧的选中行
        int oldRow = [self.pickerView selectedRowInComponent:i];
        
        
        NSArray *items = self.foodsData[i];
        
        NSInteger rowCount = items.count;
        
        NSInteger randomRow = arc4random_uniform(rowCount);
        
        // 获取旧的随机数与新的随机数据是否相同，再随机
        while (oldRow == randomRow) {
            randomRow = arc4random_uniform(rowCount);
        }
        
        [self pickerView:nil didSelectRow:randomRow inComponent:i];
        [self.pickerView selectRow:randomRow inComponent:i animated:YES];
    }
    
}

@end
