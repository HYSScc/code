#import <Foundation/Foundation.h>

@interface Person : NSObject
- (void)test;
+ (void)test;

- (void)test1;
+ (void)test2;

- (void)haha1;
+ (void)haha2;
@end

@implementation Person
- (void)test
{
    NSLog(@"调用了-test方法");
    
    //会引发死循环
    //[self test];
}

+ (void)test
{
    NSLog(@"调用了+test方法");
    
    //会引发死循环
    //[self test];
}

- (void)test1
{
    [self test]; // 调用了-test
    NSLog(@"调用了-test1方法");
    
}

+ (void)test2
{
    [self test]; // 调用了+test
    NSLog(@"调用了+test2方法");
}

- (void)haha1
{
    NSLog(@"haha1");
}

(void)haha3()
{

}

+ (void)haha2
{
    //haha3(); // 函数的调用
    //[self haha3]; // 调用 + haha3
    //[self haha1];
}
@end

int main()
{
    [Person test2];
    //Person *p = [Person new];
    //[p test1];
    return 0;
}