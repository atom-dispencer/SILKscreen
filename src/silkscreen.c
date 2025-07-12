#include "internal/silkscreen.h"
#include <stdio.h>

int main(int count, char *argv[])
{
    for (int i = 0; i < count; i++)
    {
        printf("%s\n", argv[i]);
    }
    return 0;
}
