/*
4.设计一个成绩类
1> 属性
* c语言成绩(可读可写)
* oc成绩(可读可写)
* 总分(只读)
* 平均分(只读)

 2> 行为
* 比较c语言成绩：跟另外一个成绩对象比较c语言成绩，返回成绩差（自己 - 其他成绩）
* 比较oc成绩：跟另一个成绩对象比较oc语言成绩，返回成绩差（自己 - 其他成绩）
* 比较ios成绩：跟另一个成绩对象比较ios语言成绩，返回成绩差（自己 - 其他成绩）
* 计算总分：算出3科成绩的总分
* 计算平均分：算出3科成绩的平均分

*/

#import <Foundation/Foundation.h>

@interface Score : NSObject
{
    int _cScore; //C语言成绩
    int _ocScore; //OC语言成绩
    
    int _totalScore; //总分
    int _averageScore; //平均分
}

- (void)setCScore:(int)cScore;
- (int)cScore;

- (void)setOcScore:(int)ocScore;
- (int)ocScore;

- (int)totalScore;
- (int)averageScore;

@end

@implementation Score

- (void)setCScore:(int)cScore
{
    _cScore = cScore;
    
    //计算总分
    _totalScore = _cScore + _ocScore;
    _averageScore = _totalScore/2;
}

- (int)cScore
{
    return _cScore;
}

- (void)setOcScore:(int)ocScore
{
    _ocScore = ocScore;
    
    //计算总分
    _totalScore = _cScore + _ocScore;
    _averageScore = _totalScore/2;
}

- (int)ocScore
{
    return _ocScore;
}

- (int)totalScore
{
    return _totalScore;
}

- (int)averageScore
{
    return _averageScore;
}


@end

int main()
{
    Score *s = [Score new];
    
    [s setCScore:80];
    [s setOcScore:90];
    
    //[s setCScore:0];
    
    int a = [s totalScore];
    int b = [s averageScore];
    
    NSLog(@"总分：%d,平均分%d", a, b);
    
    
    
    
    
    
    return 0;
}