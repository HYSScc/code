#import <Foundation/Foundation.h>
/*
 self的用途
 1> 谁调用了当前方法，self就代表谁
 * self出现在对象方法中，self就代表对象
 * self出现在类方法中，self就代表类
 
 2> 在对象方法中，可以利用“self->成员变量名”访问当前对象内部的成员变量
 
 3> [self 方法名]：可以调用其他对象方法和类方法
 */

@interface Dog : NSObject
- (void)bark;
- (void)run;
@end

@implementation Dog
- (void)bark
{
    NSLog(@"汪汪汪");
}
- (void)run
{
    [self bark];
    NSLog(@"跑跑跑");
}
@end

int main()
{
    Dog *d = [Dog new];
    
    [d run];

    return 0;
}