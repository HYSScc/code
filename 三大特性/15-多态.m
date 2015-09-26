#import <Foundation/Foundation.h>
/*
 多态
 1> 没有继承就没有多态
 2> 代码的体现：父类类型的指针指向子类对象
 3> 好处：如果函数\方法参数中使用的是父类类型，可以传入父类、子类对象【feed函数，在main函数中调用时的体现】
 4> 局限性
 1.父类类型的变量 不能 直接调用子类特有的方法,必须强转喂子类类型变量后，才能直接调用子类的特有方法
 */

// 动物
@interface Animal : NSObject
- (void)eat;
@end

@implementation Animal
- (void)eat
{
    NSLog(@"Animal吃东西");
}
@end

// 狗
@interface Dog : Animal
- (void)run;
@end

@implementation Dog
- (void)run
{
    NSLog(@"Dog跑起来了");
}

- (void)eat
{
    NSLog(@"Dog吃东西");
}
@end

// 猫
@interface Cat : Animal

@end

@implementation Cat
- (void)eat
{
    NSLog(@"Cat吃东西");
}
@end

// 这个函数专门喂我们动物
//void feed(Dog *d)
//{
//    [d eat];
//}
//
//void feed2(Cat *c)
//{
//    [c eat];
//}

// 如果参数中使用的是父类类型，可以传入父类、子类对象
void feed(Animal *a) // 同时能喂狗和猫
{
    [a eat];
}

int main()
{
    
    Animal *aa = [Dog new];
    // 多态的局限性：父类类型的变量 不能 用来调用子类的方法
    //[aa run];
    
    // 将aa转为Dog *类型的变量
    Dog *dd = (Dog *)aa;// aa是动物类型的，要将aa赋值给Dog时，如果不写（Dog *）编译器会报错，因为动物不一定是狗 也可能是猫。所以将aa赋值给Dog时，要在aa前面加上（Dog *），表示aa是Dog类型的动物。这样编译器才能通过。
    
    [dd run];
    
//    Dog *d = [Dog new];
//    
//    [d run];
    
    
    /*
    Animal *aa = [Animal new];
    
    feed(aa);
    
    Dog *dd = [Dog new];
    
    feed(dd);
    
    Cat *cc = [Cat new];
    
    feed(cc);
     */
    
    
    
    //NSObject *n = [Dog new];
    //NSObject *n2 = [Animal new];
    
    
    // 多种形态
    //Dog *d = [Dog new]; // Dog类型
    
    // 多态：父类指针指向子类对象
    //Animal *a = [Dog new];
    
    // 调用方法时会检测对象的真实形象
    //[a eat];

    return 0;
}















