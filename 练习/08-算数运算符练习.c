//提示用户输入一个时间的秒数，比如500秒，然后输出对应的分钟和秒，比如500s就是8分20秒

#include <stdio.h>

int main()
{
    // 1.提示用户输入秒数
    printf("请输入一个时间（秒）:\n");
    
    // 2.接收用户的输入的时间
    int time;
    scanf("%d", &time);
    
    // 3.转换成对应的时间分钟和秒
    int minute = time / 60; // 分钟
    int second = time % 60; // 秒
    
    printf("%d秒 = %d分钟%d秒\n", time, minute, second);
    
    return 0;
}