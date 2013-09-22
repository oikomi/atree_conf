#include <stdio.h>
#include "config.h"
#include "atree.h"


int main()
{
    char *file_name = "./test.conf";
    atree_t conf;
    gbConfigLoad( &conf, file_name );
    char * str =  gbConfigReadString( &conf, "logfile", "DEF" );
    printf("str: %s\n", str);

    return 0;

}

