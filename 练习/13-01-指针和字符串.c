

#include <stdio.h>

int main()
{
    // 字符串变量
    char name[] = "it";
    
    // 字符串常量
    char *name2 = "it"; // name2指向的是字符串首字符
    
    printf("%c\n", *name2);
    
    printf("%s\n", name2);
    
    return 0;
}