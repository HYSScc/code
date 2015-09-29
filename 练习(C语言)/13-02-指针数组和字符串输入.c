#include <stdio.h>

int main()
{
    // 字符串输入
    char name[20];
    
    printf("请输入姓名:\n");
    
    scanf("%s", name); //  %s从name对应的地址开始，一个一个存放用户输入的字符，并字符后加上 '\0'
    
    printf("输入的姓名是:%s\n", name);
    printf("输入的姓名是:%c\n", name[1]);
    return 0;
}


void test()
{
    // 指针数组
    char *names[5] = {"Jack", "Rose", "Jim"};
    
    // 二维字符串数组
    char name2[3][5] = {"Jack", "Rose", "JJ"}; // 存放三个char类型的数组，并且每个char类型的数组长度为10
}