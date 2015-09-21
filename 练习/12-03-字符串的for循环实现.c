// 编写一个函数char_contains(char str[], char c),
 // 如果字符串str中包含字符c则返回数值1，否则返回数值0；


#include <stdio.h>
#include <string.h>

int char_contains(char str[], char c)
{
    // 遍历整个字符串
    for (int i = 0; i<strlen(str); i++) {
        
        // 如果发现某个字符 = 参数c直接返回1，退出函数
        if (str[i] == c) {
            return 1;
        }
    }

    //说明str里面不包含字符c
    return 0;
}


int main()
{
    
    int a = char_contains("itcast", 'c');
    
    printf("%d\n", a);
    

    return 0;
}