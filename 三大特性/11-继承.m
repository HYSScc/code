#import <Foundation/Foundation.h>
/*
 继承的好处：
 1.抽取重复代码
 2.建立了类之间的关系
 3.子类可以拥有父类中的所有成员变量和方法
 
 注意点
 1.基本上所有类的根类是NSObject
 */

/**********Animal的声明**********/
@interface Animal : NSObject
{
    int _age;
    double _weight;
}
- (void)setAge:(int)age;
- (int)age;
- (void)setWeight:(double)weight;
- (double)weight;
@end
/**********Animal的实现**********/
@implementation Animal
- (void)setAge:(int)age
{
    _age = age;
}
- (int)age
{
    return _age;
}
- (void)setWeight:(double)weight
{
    _weight = weight;
}
- (double)weight
{
    return _weight;
}
@end

/**********Dog的声明**********/
//:Animal 继承了Animal，相当于拥有了Animal里面的所有成员变量和方法
// Animal 称为Dog的父类
// Dog 称为 Animal的子类
@interface Dog : Animal
@end
/**********Dog的实现**********/
@implementation Dog

@end
/**********Cat的声明**********/
@interface Cat : Animal

@end
/**********Cat的实现**********/
@implementation Cat

@end

int main()
{
    Dog *d = [Dog new];
    
    [d setAge:10];

    NSLog(@"age=%d" , [d age]);
    return 0;
}

















