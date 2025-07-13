#ifndef SILKSCREEN_API_H
#define SILKSCREEN_API_H

#define MAX_PATH_LENGTH 256

enum SILKscreen_Status
{
    SILKSCREEN_OK               = 0,
    SILKSCREEN_SCRIPT_NOT_FOUND = 1
};

enum SILKscreen_Status SILKscreen_Init(char *script_path);

#endif
