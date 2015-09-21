

#include <stdio.h>

int main()
{
    int i = 67 + '4'; // 67 + 52 // 119
    char c = 'c' - 10; // 99 - 10 // 89
    
    printf("%d - %c\n", i, i);
    printf("%d - %c\n", c, c);
    
    return 0;
}