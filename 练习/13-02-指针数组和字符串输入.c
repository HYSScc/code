#include <stdio.h>

int main()
{
    // 字符串输入
    char name[20];
    
    printf("请输入姓名:\n");
    
    scanf("%s", name); //  字符后加上 '\0'
    
    printf("输入的姓名是:%s\n", name);
    printf("输入的姓名是:%c\n", name[1]);
    return 0;
}


void test()
{
    // 指针数组
    char *names[5] = {"Jack", "Rose", "Jim"};
    
    // 二维字符串数组
    char name2[3][5] = {"Jack", "Rose", "JJ"};
}