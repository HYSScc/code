#import <Foundation/Foundation.h>
/*
 对象方法
 1> 减号 - 开头
 2> 只能由对象来调用
 3> 对象方法中能访问当前对象的成员变量（实例变量）
 
 类方法
 1> 加好 + 开头
 2> 只能由类名来调用
 3> 实例变量age不能在类方法中访问/类方法中不能访问成员变量（实例变量）
 
 类方法的好处和使用场合
 1> 不依赖于对象，执行效率高
 2> 能用类方法尽量用类方法
 3> 场合：当方法内部不需要使用到成员变量时，就可以改为类方法
 
 可以允许类方法和对象方法同名
 */



@interface Person : NSObject
{
    int _age;
}

//类方法都是以+开头
+ (void)printClassName;

- (void)test;
+ (void)test;

@end

@implementation Person

+ (void)printClassName
{
    NSLog(@"这个类叫做Person");
}

- (void)test
{
    int _age = 10;
    NSLog(@"调用了对象test方法%d", _age);
     [Person test];
}

+ (void)test
{
    // instance variable 'age' accessed in class method
    // 实例变量age不能在类方法中访问
    // NSLog(@"调用了类test方法-%d", age);
    NSLog(@"调用了类test方法");
}

@end

int main()
{
    Person *p = [Person new];
    [p test];
    //[Person test];
    //[Person printClassName ];
    
//    类方法只能由类名调用
//    Person *p = [Person new];
//    系统会认为现在调用的printClassName是一个对象方法
//    [p printClassName];

    return 0;
}
