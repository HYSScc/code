/*
继承的使用场合
 1> 当两个类拥有相同属性和方法的时候，就可以将相同的东西抽取到一个父类中
 2> 当A类完全拥有B类中的部分属性和方法，可以考虑让B类继承A类
 
 继承：
 A
 {
    int _age;
    int _no;
 }
 
 B : A
 {
    int _weight;
 }

// 继承： xx 是 xxx
// 组合： xxx 拥有 xxx
2. 组合
 A
 {
    int _age;
    int _no;
 }
 
 B
 {
    A *_a;
    int _weight;
 }
 
*/
#import <Foundation/Foundation.h>
@interface Score : NSObject
{
    int _cScore;
    int _ocScore;
}
@end

@implementation Score
@end

// 继承： xx 是 xxx
// 组合： xxx 拥有 xxx

@interface Student : NSObject
{
    //组合
    Score *_score;
//    int _cScore;
//    int _ocScore;
    int _age;
}
@end

@implementation Student
@end

int main()
{

    return 0;
}