#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
}
- (void)setAge:(int)age;
- (int)age;

- (void)test;

@end

@implementation Person
- (void)setAge:(int)age
{
    //_age = age;
    self->_age = age;
}
- (int)age
{
    return _age;
}

- (void)test
{
    //self : 指针指向方法调用者,代表着当前对象。
    int _age = 20;
    NSLog(@"Person的年龄是%d岁", self->_age);
}

@end

int main()
{
    Person *p = [Person new];
    [p setAge:10];
    [p test];
    


    return 0;
}







