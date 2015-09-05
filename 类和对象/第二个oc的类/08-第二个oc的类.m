/*
 人
 类名：Person
 属性（成员变量\实例变量）：体重、年龄
 行为（方法）：走路
 */
#import <Foundation/Foundation.h>

/*
 1.类的声明
    * 成员变量
    * 方法的声明
*/

@interface Person : NSObject
{
    @public
    int age;
    double weight;
}

- (void)walk;

@end

/*
 2.类的实现

*/
@implementation Person

- (void)walk
{

    NSLog(@"%d岁、%f公斤的人走了一段路", age ,weight);
}

@end



int main()
{
    Person *p = [Person new];
    p->age = 20;
    p->weight = 40;
    
    Person *p2 = [Person new];
    p2->age = 30;
    p2->weight = 50;
    
    p = p2;
    
    p->age = 40;
    
    [p2 walk];
    
    
    
    
    
    
    /*
    Person *p = [Person new];
    p->age = 20;
    
    Person *p2 = [Person new];
    p2->weight = 50.0;
    
    [p walk];
     */
    
    
    /*
    Person *p = [Person new];
    
    p->age = 20;
    p->weight = 50.0;
    
    [p walk];
    
    Person *p2 = [Person new];
    
    p2->age = 30;
    p2->weight = 60.0;
    
    [p2 walk];
    */
    
    return 0;
}
















