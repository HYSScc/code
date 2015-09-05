/*
1.//重写：子类重新实现父类中的某个方法，覆盖父类以前的方法
2.注意
 1> 父类必须声明在子类的前面
 2> 子类是不能拥有和父类相同的成员变量
 3> 调用某个对象的方法时，优先去当前对象中找，如果找不到，去父类中找
 
 
 
3.坏处：耦合性太强
*/
#import <Foundation/Foundation.h>
// Person
@interface Person : NSObject
{
    int _age;
}
- (void)setAge:(int)age;
- (int)age;

- (void)run;

+ (void)test;
@end

@implementation Person
- (void)setAge:(int)age
{
    _age = age;
}
- (int)age
{
    return _age;
}

- (void)run
{
    NSLog(@"Person---跑");
}

+ (void)test
{
    NSLog(@"Person+test");
}
@end

// 不允许子类和父类拥有相同名称的成员变量
// Student
@interface Student : Person
{
    int _no;
    //int _age;
}

+ (void)test2;
@end

@implementation Student

//重写：子类重新实现父类中的某个方法，覆盖父类以前的方法
- (void)run
{
    NSLog(@"Student---跑");
}

+ (void)test2
{
    [self test];
}

@end

int main()
{
    [Student test2];
//    Student *s = [Student new];
//    
//    [s run];

    return 0;
}










