
#import <Foundation/Foundation.h>

typedef enum {
    SexMan,
    SexWoman
} Sex;

@interface Student : NSObject
{
    //成员变量的命名规范:一定要以下划线 _ 开头
    //作用:
    //1.让成员变量和get方法的名称区分开
    //2.可以跟局部变量区分开，一看到下划线开头的变量，一般都是成员变量
    int _no;
    Sex _sex;
}

// sex的set方法和get方法
- (void)setSex:(Sex)sex;
- (Sex)sex;

// no的set方法和get方法
- (void)setNo:(int)no;
- (int)no;

@end

@implementation Student

- (void)setSex:(Sex)sex
{
    _sex = sex;
}

- (Sex)sex
{
    return _sex;
}

- (void)setNo:(int)no
{
    _no = no;
}

- (int)no
{
    return _no;
}

@end

int main()
{
    Student *stu = [Student new];
    [stu setSex:SexMan];
    [stu setNo:10];
    [stu sex];
    [stu no];
    
    NSLog(@"一个%d岁，性别是%d的人", [stu no],[stu sex]);
    

    return 0;
}