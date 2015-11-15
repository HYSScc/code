//
//  ContactsTableViewController.m
//  01-私人通讯录
//
//  Created by tom-pc on 15/11/14.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "AddViewController.h"
#import "Contact.h"
#import "EditViewController.h"
#import "ContactCell.h"

@interface ContactsTableViewController ()<UIActionSheetDelegate, AddViewControllerDelegate, EditViewControllerDalegate>
@property (nonatomic, strong) NSMutableArray *contacts;
@end

@implementation ContactsTableViewController

- (NSMutableArray *)contacts
{
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //取出分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#warning 第五步注销功能
// 点击注销就会调用这个方法
- (IBAction)loginOut:(id)sender {
    // 判断是否要真的注销
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否注销?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
    // 回到登录界面
}
#pragma mark - ActionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) return;
    // 回到登录界面
    [self.navigationController popViewControllerAnimated:YES];
    
}

// 逆传
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    NSLog(@"_____%@", segue.destinationViewController);
//    
//    AddViewController *vc = segue.destinationViewController;
//    vc.contact = self;
//}
//- (void)setName:(NSString *)name phone:(NSString *)phone
//{
//    NSLog(@"%@--%@", name, phone);
//}

// 代理逆传
// 跳转之前调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"_____%@", segue.destinationViewController);
    
    if ([segue.destinationViewController isKindOfClass:[AddViewController class]]) {
        AddViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }else{ // 跳转到编辑控制器
        EditViewController *edit = segue.destinationViewController;
        
        NSIndexPath *seleteIndex = [self.tableView indexPathForSelectedRow];
        
        edit.contact = self.contacts[seleteIndex.row];
        
        edit.delegate = self; // 添加
    }
    
}
// 成功添加一个联系人的时候调用,添加控制器代理方法
- (void)addViewController:(AddViewController *)add didAddContact:(Contact *)contact
{
    // 保存数据
    [self.contacts addObject:contact];
    
    // 刷新表格
    [self.tableView reloadData];
    
    // 把数据展示到联系人界面
    NSLog(@"%@---%@", contact.name, contact.phone);
}

// 编辑控制器的代理方法,成功更新了一个联系人的时候调用
- (void)editViewController:(EditViewController *)edit didUpdateModelContact:(Contact *)contact
{
    // 刷新表格
    [self.tableView reloadData];
}
















#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}
// 返回行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *ID = @"contact";
//    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 1.创建cell
    ContactCell *cell = [ContactCell cellWithTableView:tableView];
    // 2.取出数据，然后拿到模型。
    Contact *contact = self.contacts[indexPath.row];
    // 给cell 里面的控件赋值
    cell.contact = contact;
//    cell.textLabel.text = contact.name;
//    cell.detailTextLabel.text = contact.phone;
    
    // Configure the cell...
    
    return cell;
}

@end
