// 设计一个函数，找出数组中的最大值


#include <stdio.h>


int maxOfArray(int array[], int length)
{
    int max = array[0];
    
    for (int i = 0; i<length; i++) {
        
        if (max<array[i]) {
            max = array[i];
        }
        
    }
    //printf("%d\n", max);
    return max;
}


int main()
{
    int ages[] = {12, 12, 34, 563, 34};
    
    int max = maxOfArray(ages, sizeof(ages)/sizeof(int));
    
    printf("最大值为%d\n", max);
    
    return 0;
}