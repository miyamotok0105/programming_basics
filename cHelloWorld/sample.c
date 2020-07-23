
//gcc -o sample sample.c
//./sample

#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    int i;

    for (i=0; i<5; i++) {
        printf("%d: test\n", i);
    }

    exit(0);
}
