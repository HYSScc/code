#include <stdio.h>

int main()
{
    // 定义一个数组
    int age[5] = {19, 2 ,23 , 34, 32};
    
    //1.
//    // for循环遍历数组元素
//    for (int i = 0; i<5; i++) {
//        printf("%d\n", age[i]);
//    }
    
    
    //2.
    // 定义一个指针指向数组元素首地址
    int *p;
    
    p = &age[0];
    // 数组名就是数组的地址，也是数组首元素的地址
    // p = age;
    
    // 指针遍历数组元素
//    for (int i = 0; i<5; i++) {
//        printf("age[%d] = %d\n", i, *(p + i));
//    }
    
    
    //3.
    printf("%d\n", p[2]);
    
    
    return 0;
}