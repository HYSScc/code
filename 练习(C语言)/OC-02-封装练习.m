/*
4.设计一个成绩类
1> 属性
* c语言成绩(可读可写)
* oc成绩(可读可写)
* 总分(只读)
* 平均分(只读)

* 计算总分：算出3科成绩的总分
* 计算平均分：算出3科成绩的平均分
*/

#import <Foundation/Foundation.h>

@interface Score : NSObject
{
    int _cScore;
    int _ocScore;
    
    int _totalScore;
    int _averageScore;
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
}
- (int)cScore
{
    return _cScore;
}
- (void)setOcScore:(int)ocScore
{
    _ocScore = ocScore;
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
    
    [s setCScore:9];
    [s setOcScore:8];
    
    int t = [s totalScore];
    int a = [s averageScore];
    
    NSLog(@"总分%i, 平均分%i", t, a);

    return 0;
}