/*
类名：Car
属性：轮胎个数、时速（速度）
行为：跑
*/

#import <Foundation/Foundation.h>

// 完整地写一个函数函数：声明和定义（实现）
// 完整地写一个类：类的声明和实现

//1.类的声明
//声明对象的属性、行为
//:NSObject 目的是：让Car这个类具备创建对象的能力
@interface Car : NSObject
{//声明对象属性(实例变量/成员变量,默认会初始化为0)
    
    //可以让外部的指针间接访问对象内部的成员变量
    @public
    int wheels;// 轮胎个数
    int speed;//  时速（xxkm/h）
    
}

//方法（行为）：方法名、参数、返回值；（声明、实现）
//只要是oc对象的方法，必须以减号 － 开头
//oc方法中任何数据类型都必须用小括号（）括住
//oc方法中的小括号：括住数据类型
- (void)run;


@end



//2.类的实现
//用来实现interface中声明的方法
@implementation Car
//方法的实现（说清楚方法里面有什么代码）

- (void)run
{
    
    NSLog(@"车子跑起来了");
}

@end




int main()
{
    // 在oc中，想执行一些行为，就写上一个中括号[行为执行者 行为名称]
    // 利用类来创建对象
    // 执行了Car这个类的new行为来创建新对象
    
    //定义了一个指针变量p，p将来指向的事Car类型的对象
    //[Car new]每次都会创建出一个新对象，并且会返回新对象本身（新对象的地址）
    Car *p = [Car new];
    
    Car *p2 = [Car new];
    
    //给p所指向对象的wheels属性赋值
    p->wheels = 4;
    
    p->speed = 250;
    
    p2->wheels = 5;
    
    p2->speed = 300;
    
    //给p所指向对象发送一条run消息
    [p run];
    [p2 run];
    
    NSLog(@"车子有%d个轮子，时速为：%dkm/h", p->wheels,p2->speed);
    
    NSLog(@"车子有%d个轮子，时速为：%dkm/h", p2->wheels,p->speed);
    return 0;
}

















