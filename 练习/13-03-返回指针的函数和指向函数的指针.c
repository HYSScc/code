//1.返回指针的函数
//#include <stdio.h>
//
//char *test();
//
//int main()
//{
//    char *name = test();
//    
//    printf("name=%s\n", name);
//    
//    return 0;
//}
//
//// 1.返回指针的函数
//char *test()
//{
//    return "Rose";
//}



// 2.指向函数的指针
#include <stdio.h>

void test()
{
    printf("调用了test函数\n");
}


int main()
{
    // (*p)是固定写法，代表指针变量p将来肯定是指向函数
    // void代表指针变量p指向的函数没有返回值
    // 右边的()：指针变量p指向的函数没有形参
    void (*p)()
    
    p = test;
    
    //(*p)(); // 利用指针间接调用test函数
    p();
    
    return 0;
}