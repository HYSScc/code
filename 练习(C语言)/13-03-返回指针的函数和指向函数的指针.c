//1.返回指针的函数
//#include <stdio.h>
//
//char *test();
//
//int main()
//{
//    char *name = test(); // 函数的调用
//    
//    printf("name=%s\n", name);
//    
//    return 0;
//}
//
//// 1.返回指针的函数
//char *test()  // 函数的返回值是char *
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
    
    p = test; // 把函数的地址赋值给指针，函数名就代表函数的地址
    
    //(*p)(); // 利用指针间接调用test函数与直接调用 test();相同
    p();
    
    return 0;
}