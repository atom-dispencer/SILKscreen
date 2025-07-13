#include "silk.h"
#include "SILKscreen_API.h"
#include <stdio.h>
#include <string.h>

enum SILKscreen_Status silk_startd(char *script_path)
{
    silk_read_script(script_path);

    return SILKSCREEN_OK;
}

enum SILKscreen_Status silk_read_script(char *script_path)
{
    int length = strlen(script_path);
    if (length > MAX_PATH_LENGTH)
    {
        printf("Length of script path (%d) exceeds maximum length %d!", length, MAX_PATH_LENGTH);
        return SILKSCREEN_SCRIPT_NOT_FOUND;
    }

    return SILKSCREEN_OK;
}
