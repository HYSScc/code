

//// 有参数宏定义
//#include <stdio.h>
//
//#define pingfang(a) ((a)*(a))
//
//int main()
//{
//    int c = pingfang(5+5)/pingfang(2);
//    
//    printf("c id %d\n", c);
//}



// 不带参数的宏定义
/*
 1.所有的预处理指令都是以#开头
 2.预处理指令分3种
 1> 宏定义
 2> 条件编译
 3> 文件包含
 3.预处理指令在代码翻译成0和1之前执行
 4.预处理的位置是随便写的
 5.预处理指令的作用域：从编写指令的那一行开始，一直到文件结束
 6.宏定义的名称用大写
 */
//#include <stdio.h>
//
//#define COUNT 4
//
//int main()
//{
//    char *name = "COUNT";
//    
//    int ages[COUNT] = {1, 2, 3, 4};
//    
//    for ( int i = 0; i<COUNT; i++) {
//        printf ("%d\n", ages[i]);
//    }
//// 从这行开始，COUNT这个宏就失效
//#undef COUNT // 结束宏定义
//    
//    int a = COUNT;
//    
//    return 0;
//}



//#include <stdio.h>
//
//// 写了#if，在最后必须写#endif。
//
//#define A (10)
//
//int main()
//{
//    
//#if defined(A) // #ifdef (A)
//    printf("haha\n"); // 如果定义了 A 这个宏，就编译haha
//#endif
//    
//#ifndef (A)
//    printf("hehe");
//#endif
//    //int a = 10;
//    /*
//    if (a == 10) {
//        printf("a是10\n");
//    }
//    else if (a == 5)
//    {
//        printf("a是5\n");
//    }
//    else
//    {
//        printf("a其他值\n")
//    }
//    */
//    
//#if (A == 10)
//    printf("a是10\n");
//#elif (A == 5)
//    printf("a是5\n");
//#else
//    printf("a是其他值");
//#endif
//    
//    
//    
//    return 0;
//}




/*
1.作用：给已经存在的类型起一个新的名称
2.使用场合
 1> 基本数据类型
 2> 指针
 3> 结构体
 4> 枚举
 5> 指向函数的指针
*/
#include <stdio.h>

typedef int MyInt;

// 给指针类型char *起一个新的类型名称String
typedef char * String;

/*
struct Student
{
    int age;
}

typedef struct Student MyStu;
*/




/*
typedef struct Student
{
    int age;
} MyStu;               //  能重新定义结构体 struct Student stu3;
*/


/*
typedef struct
{
    int age;
} MyStu;               // 只能用命名定义结构体 MyStu stu3;
*/



/*
enum Sex {Man, Woman};
typedef enum Sex MySex;
*/



/*
typedef enum Sex {
    Man,
    Woman
} MySex;
*/


/*
typedef enum {
    Man,
    Woman
} MySex;
*/





/*
typedef int (*MyPoint)(int, int);

int minus(int a, int b)
{
    return a - b;
}

int sum(int a, int b)
{
    return a + b;
}
*/



/*
struct Person
{
    int age;
};


typedef struct Person * PersonPoint;
*/





typedef struct Person
{
    int age;
} * PersonPoint;




int main()
{
// 定义结构体变量
    struct Person p = {20};
    
    //struct Person *p2 = &p;
    PersonPoint p2 = &p;
    
    
// 定义函数
    //MyPoint p = sum;
    //MyPoint p2 = minus;
    

    /*
    int (*p)(int, int) = sum;
    p(10, 11);
    int (*p2)(int, int) = minus;
    p2(11, 12);
    */
     
     
// 枚举
    MySex s = Man;
    //enum Sex s = Man;
    //enum Sex s2 = Woman;
    
    
    
// 结构体
    
    //struct Student stu;
    
    //struct Student stu2;
    
    //MyStu stu;
    MyStu stu = {20};
    
    //MyStu stu2;
    MyStu stu2 = {21};
    
    return 0;
}


void test()
{
    int a ;
    
    MyInt i = 10;
    
    MyInt b1, b2;
    
    printf("i is %d", i);
}


void test2()
{
    String name = "Jack";
    
    printf("%s\n", name);
}
