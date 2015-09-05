
typedef enum
{
    SexMan,
    SexWoman
}Sex;

typedef struct{
    int year;
    int month;
    int day;
} Date;

typedef enum{

    ColorBlack,
    ColorRed,
    ColorGreen
} Color;

/*
 
 学生：
 成员变量：性别、生日、体重、最喜欢的颜色、狗(体重、毛色、吃、跑)
 方法：吃、跑步、遛狗、喂狗

*/
#import <Foundation/Foundation.h>
@interface Dog : NSObject
{   @public
    double weight;   //体重
    Color curColor;  //毛色

}
- (void)eat;
- (void)run;
- (void)print;

@end

@implementation Dog

- (void)print
{   NSLog(@"gou");
}

- (void)eat
{   //每吃一次，体重就加一
    weight += 1;
    //weight = weight + 1;
    NSLog(@"狗吃完这次后的体重是%f", weight);
}
- (void)run
{
    weight -= 1;
    NSLog(@"狗跑完这次后的体重是%f", weight);
}


@end

@interface Student : NSObject
{   @public
    Sex sex; //性别
    Date birthday; // 生日
    double weight; //体重（kg）
    Color favColor; //最喜欢的颜色
    char *name;
    
    //重点：狗
    Dog *dog;
    
}
- (void)eat;
- (void)run;
- (void)print;

- (void)liugou;
- (void)weigou;
@end

@implementation Student

- (void)liugou
{
    //让狗跑起来（调用狗的run方法）
    [dog run];
}

- (void)weigou
{
    //让狗吃（调用狗的eat方法）
    [dog eat];
}

- (void)print
{

    NSLog(@"性别＝%d,喜欢的颜色＝%d,姓名＝%s,生日＝%d-%d-%d", sex ,favColor, name, birthday.year, birthday.month, birthday.day );

}
- (void)eat
{   //每吃一次，体重就加一
    weight += 1;
    //weight = weight + 1;
    NSLog(@"学生吃完这次后的体重是%f", weight);
}
- (void)run
{
    weight -= 1;
    NSLog(@"学生跑完这次后的体重是%f", weight);
}


@end

int main()
{
    Student *s = [Student new];
    Dog *d = [Dog new];
    d->curColor = ColorGreen;
    d->weight = 20;
    s->dog = d;
    //s->dog = [Dog new];
    
    /*
    s->weight = 50;
    
    s->name = "Jack";
    
    // 性别
    s->sex = SexMan;
    
    // 生日
    //s->birthday = {2011, 9 , 10};
    
    Date d = {2011, 9, 10};
    s->birthday = d;
    
    
     //s->birthday.year = 2011;
     //s->birthday.month = 9;
     //s->birthday.day = 10;
    
    //最喜欢的颜色
    s->favColor = ColorBlack;
    */
    
    [s liugou];
    [s weigou];
    
//    [s eat];
//    [s eat];
//    
//    [s run];
//    [s run];
//    
//    [s print];
    return 0;
}











