
// 编写一个函数，将小写字母转成大写

#include <stdio.h>

char upper(char c)
{
    // 如果是小写字母，将其转成大写
    if (c>='a' && c<='z') {
        return c - ('a' - 'A');
    }
    else
    {   // 如果不是，则返回本身
        return c;
    }
    
    
}


int main()
{
    
    
    
    char c = upper('o');
    
    printf("%c\n", c);

    return 0;
}