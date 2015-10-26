//
//  ViewController.m
//  03-单组表格
//
//  Created by tom-pc on 15/10/17.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *heros;
@end

@implementation ViewController

- (NSArray *)heros
{
    if (_heros == nil) {
        _heros = [Hero heros];
    }
    return _heros;
}

/**
 UITableViewStylePlain,   // 平板的格式
 UITableViewStyleGrouped  // 分组的格式
 */

- (UITableView *)tableView
{
    if (_tableView == nil) {
        // 表格控件在创建时必须指定样式，只能使用以下实例化方法
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.dataSource = self; // 相当于将tableView连线到控制器，满足协议
        _tableView.delegate = self; // 添加代理
        
        [self.view addSubview:_tableView]; // 将tableView添加到视图
    }
    return  _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView]; // 将tableView加载，不然到不了界面
    
    self.tableView.rowHeight = 160; // 设置行高
    
    // 分隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    /** 
     32位真彩色 ARGB
     A = Alpha
     24位真彩色 RGB 2^8 * 2^8 * 2^8 = 2 ^ 24 = 2 ^ 4 * 2 ^ 10 = 16 * 100万
     R = Red    1个字节 8位 0~255
     G = Green
     B = Blue
     */
    // headView,放在tableView最顶部的视图，通常放图片轮播器
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 357, 130)];
    head.backgroundColor = [UIColor blueColor];
    self.tableView.tableHeaderView = head;
    
    // footView,通常做上拉刷新
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 357, 44)];
    footView.backgroundColor = [UIColor redColor];
    self.tableView.tableFooterView = footView;
    
    NSLog(@"%@", self.heros);
}

#pragma mark - 数据源方法
// 分组中的数据总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

/**
 UITableViewCellStyleDefault, // 默认类型 标题+可选图像
 UITableViewCellStyleValue1,  // 标题+明细+图像
 UITableViewCellStyleValue2,  // 不显示图像
 UITableViewCellStyleSubtitle // 标题+明细+图像
 */

// 每个单元格的明细
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0.可重用标示符字符串
    // static静态变量，能够保证系统为变量只分配一次内存空间
    // 静态变量一旦被创建就不会被释放，只有应用程序被销毁时，才被释放
    static NSString *ID = @"Cell";
    
    // 1.取缓存池查找可重用的单元格
    //   此方法的调用频率非常高
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果没有找到
    // 创建单元格，并设置cell有共性的属性
    if (cell == nil) {
        // 实例化新的单元格
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        // 右边箭头
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        // 背景颜色(会影响到未选中表格行的标签背景)
//        cell.backgroundColor = [UIColor redColor];
        // 背景视图
//        UIImage *bgImage = [UIImage imageNamed:@"img_01"];
//        cell.backgroundView = [[UIImageView alloc] initWithImage:bgImage];
////        // 背景视图颜色
//        UIView *bgView = [[UIView alloc] init];
//        bgView.backgroundColor = [UIColor redColor];
//        cell.backgroundView = bgView;
        
        // 没有选中的背景颜色
        // 选中的背景视图
//        UIImage *selectBgImage = [UIImage imageNamed:@"img_02"];
//        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:selectBgImage];
    }
    
    // 代码运行至此一定有了cell
    
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // 取出英雄对象
    Hero *hero = self.heros[indexPath.row];
    // 标题
    cell.textLabel.text = hero.name;
    // 明细信息
    cell.detailTextLabel.text = hero.intro;
    // 图像
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    
    // 设置右边的箭头
    // 1> UITableViewCellAccessoryDisclosureIndicator箭头可以“提示”用户，当前行是可以点击的，通常选中行，会跳到新的页面
    // 2> UITableViewCellAccessoryCheckmark 对号，通常提示用户该行数据设置完毕，使用的比较少
    // 3> UITableViewCellAccessoryDetailButton 按钮，通常点击按钮可以做独立的操作，例如alertView
    // 点击按钮并不会选中行
    // 4> UITableViewCellAccessoryDetailDisclosureButton 箭头+按钮，各自操作
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//    cell.accessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    // 指定右侧的自定义视图
    
    // 1> 通常accessoryType提供的类型不能满足时，才会使用自定义控件
    // 2> 但是需要自行添加监听方法，通常用在自定义cell，不要写在视图控制器中
    // 3> 自定义控件的事件触发，同样不会影响表格行的选中
//    UISwitch *switcher = [[UISwitch alloc] init];
//    // 添加监听方法
//    [switcher addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
//    
//    cell.accessoryView = switcher;
    
    return cell;
}

- (void)switchChanged:(UISwitch *)sender
{
    NSLog(@"%s %@", __func__, sender);
}

#pragma mark - 代理方法
// 取消选中某一行，极少用，容易出错
// didDeselectRowAtIndexPath
// didSelectRowAtIndexPath
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s %@", __func__, indexPath);
}

// 选中某一行,有箭头的
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s %@", __func__, indexPath);
}

// accessoryType为按钮时，点击右侧按钮的监听方法
// 此方法不会触发行选中，跟行的选中各自独立
// 只是为accessoryType服务，对自定义控件不响应
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s %@", __func__, indexPath);
}
/**
 代理方法的优先级比rowHeight优先级高
 
 应用场景：很多应用程序，每一行的高度是不一样的，例如：新浪微博
 
 表格工作观察的小结
 
 1> 先执行
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 2> 再执行（计算每一行的行高）
    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 
 问题：在此方法执行时，cell被实例化了嘛？
 方法的作用是什么？
 
 scollView为什么能滚动：需要指定contentSize才能滚动，如果没有实现这个方法，行高默认是44
 
 需要知道每一行的高度，才能够准确的计算出contentSize
 
 知道每一行的高度后，自然知道每一个屏幕应该显示对少行，表格明细方法的执行次数
 
 3> 最后执行（明细，调用屏幕显示所需要的行数，懒加载，只有要显示的表格行，才会被实例化）
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 
 小的结论
 
 * tableView.rowHeight // 效率高，适用于所有的表格行高度一致
 * 代理方法指定行高       // 效率差，适合于每一个行的行高不一样，能够让表格更加灵活
 
 */
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return (indexPath.row % 2) ? 60 : 44;
//    // 可以使用rowHeight属性
////    return 44;
//}


@end
