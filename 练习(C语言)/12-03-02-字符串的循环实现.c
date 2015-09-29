// 编写一个函数char_contains(char str[], char c),
// 如果字符串str中包含字符c则返回数值1，否则返回数值0；

#include <stdio.h>

int char_contains(char str[], char c)
{
    int i = 0;
    
    // 精简的一句
//    int i = -1;
//    
//    while (srt[++i] != c && str[i] != '\0') {
//        return str[i] != '\0';
//    }
    
    
    // 遍历整个字符串
    while (str[i] != '\0') // 数值不为0，就为真
    {
        
        // 如果发现某个字符等于字符c，就返回1，退出函数
        if (str[i] == c) {
            return 1;
        }
        
        i++;
    }
    // 说明str中不包含字符c
    return 0;
}


int main()
{
    int a = char_contains("itcast", 'c');
    
    printf("%d\n", a);
    
    return 0;
}