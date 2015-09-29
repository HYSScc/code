/*
1*1
2*1 2*2
3*1 3*2
4*1 4*2
5*1 5*2
6*1 6*2
7*1 7*2
8*1 8*2
9*1 9*2
*/
#include <stdio.h>

int main()
{
        int a = 9;
    
    for (int i = 0; i<9; i++, a--) {
        //printf("%d*%d\n", n, n);
        for (int j=0; j<9-a+1; j++) {
            printf("%d*%d ", i+1, j+1);
        }
        printf("\n");
    }
    
    
    
    
    return 0;
}